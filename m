Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E74606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k3YfAgKl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy6qf2nV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BsLuHizLc3GlxB5hI1TsZDP3spN/v/I/xr4RF7IafvM=; b=k3YfAgKlizHj9o
	EbAonm78WAlssMiMlimkQVbtcwjwB98xYMioUjmrLvtqKaRmdDwUPEWjVu7QlTqR+2rWe4KpfOi50
	KO0lu8vKMNkts9Ybfucg4Qu2ulmcw6k89sv/R8ctXCdA0rw0MA/UoFOuGZ7os+ABg2h+BQBQ5JnZN
	8yO/eYhW4z7bV/CD0JKltU0jOheKY5o9m+Z5rtGDPiu44RBtkpHeM8e2jGoIb5vS1pa+NvvdI5m6A
	6GmV/nqlvCZ4tbKaebhKRmS6+yLvi9QwfdYYpVQzYFE4MH84gGtRSJuCvkDHm4cVcarXecBWwOkGO
	C02UXzPYmm8BlsiONPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47u-0000000CTVA-0t3m;
	Thu, 19 Nov 2026 15:32:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47r-0000000CTTf-3L17
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:32:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DAB2440A7;
	Thu, 19 Nov 2026 15:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310641F000C7;
	Thu, 19 Nov 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102359;
	bh=BsLuHizLc3GlxB5hI1TsZDP3spN/v/I/xr4RF7IafvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hy6qf2nV6wPs9dnIIEAqyqg2colUxWUMNsgrywbi91vwTXifk/S9u9mxmvSwqDRve
	 eOdQm4XwpMtSoXk8udNOhqslvXaLjHPLhjH/OVAEvspa7bU24n440OjUqsx1Wll4yU
	 4bSjXgngyUzutntbJqeSqcRjvpTeYiHZEzZ5AzScTGY06CXl1Z/0eGwCZS8TZzuUNC
	 ep6UbnRf1ZwDpaE5ZiL7IHbO67VNz/tXuIgjgTLq+DXde0NoiINVGjqUbBQUmmpeCV
	 efNBIeYZ2n+yat7QbR4V9FUuo+Cc3QtVcmkuvyhIlTtikjRv9NTAK6Mn5jTbYeDiPd
	 kbGJZIu02RjWg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 05/10] iio: adc: stm32-adc: Detach chained IRQ handler before removing domain
Date: Thu, 19 Nov 2026 15:30:38 +0000
Message-ID: <20261119153151.1397003-6-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261119153151.1397003-1-lee@kernel.org>
References: <20261119153151.1397003-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stm32_adc_irq_remove() disposes of the child IRQ mappings and removes
priv->domain before clearing the parent chained IRQ handlers.  Because
the parent hardware interrupt lines remain unmasked while child devices
use dummy_irq_chip, an interrupt arriving during teardown invokes
stm32_adc_irq_handler() after irq_domain_remove() has freed
priv->domain, and irq_set_chained_handler() also leaves handler_data
dangling.

Detach the chained handlers and clear handler_data with
irq_set_chained_handler_and_data() before tearing down the mappings and
removing the domain.

Fixes: 1add69880240 ("iio: adc: Add support for STM32 ADC core")
Closes: https://sashiko.dev/#/bug/linux-27c38690-bc20-43aa-a3fc-1ddd6f1bb74e
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/iio/adc/stm32-adc-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index 4b532db3db62..13b75475046c 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -467,12 +467,12 @@ static void stm32_adc_irq_remove(struct platform_device *pdev,
 	int hwirq;
 	unsigned int i;
 
+	for (i = 0; i < priv->nb_irqs; i++)
+		irq_set_chained_handler_and_data(priv->irq[i], NULL, NULL);
+
 	for (hwirq = 0; hwirq < priv->nb_adc_max; hwirq++)
 		irq_dispose_mapping(irq_find_mapping(priv->domain, hwirq));
 	irq_domain_remove(priv->domain);
-
-	for (i = 0; i < priv->nb_irqs; i++)
-		irq_set_chained_handler(priv->irq[i], NULL);
 }
 
 static int stm32_adc_core_switches_supply_en(struct stm32_adc_priv *priv,
-- 
2.56.1.708.g77570a6a1d-goog


