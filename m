Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F960A2603
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ckvMz92U;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=RVvrMH6Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0oMXGLoKcrMltsWL6uMm4zEKFcls2YExOE/JJ6JogwE=; b=ckvMz92Uo5SFrp
	5IPRQ7qIGtLCieJWhJdUz/Gmp7QsCPZ/8oziiUJLKfLbXTMml8VZdvSr+xCG5+IqABIO3XW6/aEQG
	J9rpeg/O767zObecz0r06qKWtiZO1BVY+VsC4SchCTdbmDUWX1p4zYfrmU505wgk8VywKtkiGUk3o
	F04wOdS1I9KAtTUl7dJyufCCmQcOl9OM3DOz1n6YFADoRl1PjeW5tbVL805spZNVQACmLUbXFRkbA
	V+u+xjLqp8pz8Fup0fR3Ifme2XzCyGzz5bWipsPAKLVpBSi/VHRIB+SFXca2S51raqkfbJ7vBKafL
	J+CQzaJSxkCKeSI0UqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrg0-0000000D1jW-1Pau;
	Fri, 13 Nov 2026 13:50:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfh-0000000D1VF-3O0f;
	Fri, 13 Nov 2026 13:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=0oMXGLoKcrMltsWL6uMm4zEKFcls2YExOE/JJ6JogwE=; b=RVvrMH6Z/IifApCX991OGZ23zo
	U6Vu4i6+RouBvXDRHWrfvr7HFsgmiseIqsRipsZ9ImX2YQCuvoeEIatmwXZ/cCRdNuDwyW3N0UpYW
	ZW5BDSrqajHEYY98UeF+ZPnbZbZwGuFVjUjHSXVF0qQttw0HgEDgasM7H96bd+4S03Csltf78Yd5a
	Hki/fOYpcK4cGJJr2UVNZ57hREGRnr7tnib2lPzTt33aTrURV6VWWr0PDqx2R/YmFWjFkdGLnOkiU
	C9JCvxuhhhx/MQEgEWzxg7JwXqKB7EgPrRCBhlnoKU42d794xx/omep2t2N6X81nzDDOMtwvwhVyC
	Qxp/23eQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 4/6] spi: rockchip: Fix runtime resume error handling
Date: Fri, 13 Nov 2026 14:50:15 +0100
Message-ID: <20261113135017.1047959-5-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113135017.1047959-1-heiko@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055029_885005_37DAF355 
X-CRM114-Status: GOOD (  13.86  )
X-Spam-Score: -2.1 (--)
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

When enabling the apb-clock any error does get handled, but when an
error happens enabling the spiclk itself, only the apb-clock is disabled
but the function then returns successful.

Fix this by also reporting the error on enabling the second clock.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 1a81fd94b439..8bb55d52d346 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -994,8 +994,10 @@ static int rockchip_spi_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = clk_prepare_enable(rs->spiclk);
-	if (ret < 0)
+	if (ret < 0) {
 		clk_disable_unprepare(rs->apb_pclk);
+		return ret;
+	}
 
 	return 0;
 }
-- 
2.53.0


