Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF26B60A2625
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JdT4JYlT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSHRraet
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=D8f1UahNUjgzMsm8znFE5WLj649JFdIGcxM6MQpNpD4=; b=JdT4JYlT0+h5ue
	SCtfihNXREHRjvZmyPwNmLKltU4Hxc5maghlgqkNGWjLzy6YtatE2J5ll04eGCpXHVrZP4fieb2G6
	hQtFYEVx6mikX0O/k0Ip2uJBuBtVT0HroPGNek4Aeg7Cfc4SEJQxueJFFb2TUISLSsYfGhGLb8/gE
	HTga5eZ0jbubBTA5NxRENGQjIPwU2HGqRdPISZQR/U33/gjM6d7pEbCi7vmpXxXwQiAwIALxuOndr
	eh3dEVX3tBe92nBe99MlwRWe2vTzxiNypQbckf1UFhVlSdpixC+8A/T/jztOhbme1C+fCZq6+ZsNU
	a+2HpD+hPBd52UUmnk/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47n-0000000CTQi-0Iro;
	Thu, 19 Nov 2026 15:32:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47l-0000000CTPl-1Vvz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:32:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0096C629A4;
	Thu, 19 Nov 2026 15:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690581F000C6;
	Thu, 19 Nov 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102351;
	bh=D8f1UahNUjgzMsm8znFE5WLj649JFdIGcxM6MQpNpD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BSHRraettQJFilRi/O+p2hhBy2E8UGAg3xN6SR5ZTBFoZJUw4gbvb2Cj4N8fztkfB
	 G5eqFErOREBSDVBzOjDkSQ+z5B/exnZLMjuPVJuE2O5BPBnJVbvbo4TjZiCeFkMdR2
	 qW9d+oJ+mB3aQVEScK4J7vaoRCGiRD+NxDcDA2KK0KbcM6kLVybYwvRUhurWv1xnEU
	 QsTFjrwQnwzrUekmr2aJV2oUWuV0OKGwiq5+jWE3goJ8/DCpq7A5OrzpSfVyylcnB2
	 jvKRGKA163gJxFStcCi6ccL7RHHQyeVX6tIHxmtKspw4o8/RHagVSFae8kqe3RbrlD
	 /KrDBhfOwBcAw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 04/10] iio: adc: stm32-adc: Validate channel index before writing chan_name
Date: Thu, 19 Nov 2026 15:30:37 +0000
Message-ID: <20261119153151.1397003-5-lee@kernel.org>
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

stm32_adc_generic_chan_init() reads the child node's reg property into a
signed int and, when the optional label property is present, writes into
adc->chan_name[val] and calls stm32_adc_populate_int_ch() before
checking whether val exceeds adc_info->max_channels.  Because val is
signed, values with the top bit set also become negative and bypass the
upper-bound check altogether.

Store val as a u32, matching fwnode_property_read_u32(), and move the
max_channels bounds check immediately after reading reg.

Fixes: 95bc818404b2 ("iio: adc: stm32-adc: add support of generic channels binding")
Closes: https://sashiko.dev/#/bug/linux-efd2944a-ec30-488d-b2ac-1c7feb831095
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/iio/adc/stm32-adc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index ab99116aea0a..42f1fc64250a 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -2745,9 +2745,9 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 	const struct stm32_adc_info *adc_info = adc->cfg->adc_info;
 	struct device *dev = &indio_dev->dev;
 	const char *name;
-	int val, scan_index = 0, ret;
+	int scan_index = 0, ret;
 	bool differential;
-	u32 vin[2];
+	u32 val, vin[2];
 
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &val);
@@ -2755,6 +2755,10 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 			return dev_err_probe(dev, ret,
 					     "Missing channel index\n");
 
+		if (val >= adc_info->max_channels)
+			return dev_err_probe(dev, -EINVAL,
+					     "Invalid channel %u\n", val);
+
 		ret = fwnode_property_read_string(child, "label", &name);
 		/* label is optional */
 		if (!ret) {
@@ -2773,10 +2777,6 @@ static int stm32_adc_generic_chan_init(struct iio_dev *indio_dev,
 			return dev_err_probe(dev, ret, "Invalid label\n");
 		}
 
-		if (val >= adc_info->max_channels)
-			return dev_err_probe(dev, -EINVAL,
-					     "Invalid channel %d\n", val);
-
 		differential = false;
 		ret = fwnode_property_read_u32_array(child, "diff-channels", vin, 2);
 		/* diff-channels is optional */
-- 
2.56.1.708.g77570a6a1d-goog


