Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC765606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iigfgH6m;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=utb6nBNx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=; b=iigfgH6mGmthQO
	Q8cK+iNWykqzSxBbkLCD0U5OFG5aEBPdEN5sPMx3cUSeoD6y9tM8vY4uUXDgEzqphgcuI6GDG71ur
	RjKwxgyp1z+HNHR/W2Ote/YkoVakH/IsPVFia09/HMheQBSnc+rC0zmPcbOS9RfiCWh8Xf98iVbmt
	pCPT9JAGS1W1UQRZiXFd6aZZBHQSLYzGunHzOeqtvNJkE6hc3A6aIBH6IrBZLgQxl0OvB3ymgHXmX
	aHmb/outK2Tg5jxuz1vXHZ8OeH7JzFto6ZA5NYuKEHuday1w6Gxe5rrFu5yrc80xCuR6vYWpGC6FO
	NsCCNwlZysA5pwznsXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCnw-00000009ww6-1xFG;
	Wed, 25 Nov 2026 13:12:56 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWCn9-00000009wX5-2nWK;
	Wed, 25 Nov 2026 13:12:10 +0000
Received: by chaosmail.tech (Postfix) id 0EF4D1C9FFA;
	Wed, 25 Nov 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h75aEkUrkcxTbFO0cw5uCyPfhp/ssg9PnW+LsVNZA04=;
	b=utb6nBNxCO1iQD13lcYGX+SR/KB+yCFQkdoAAbNoV0F2wcTylLVsvpdA59iZhwt+lPbNBn
	LtOj7XCwVh131NmvLuYtsCAPt8NmacGZ+m6VUYho7f0eoKLvUX5GWMyWueCx7nDzJQ6V6D
	yPS6BNdIoIZ/K0PbhW/3EwDOuECJpFY=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:46 +0100
Subject: [PATCH v3 2/5] soc: apple: tunable: Allow passing NULL to
 tunable_apply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-t8122-phy-v3-2-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
In-Reply-To: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=686;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=6r5CB8eIrYPysJHrZefwLcauhrBv1L4lVD2FHBotaw0=;
 b=7Hl3SSsNqQXTfHDPCF0hI7xu+JIZKPPdwv08gGMbeUKegkr4xT3fwDlP/Hr9tKYjcernMLIhr
 4JQJjPbMVfnBChztXLSPhC6GaEI+QDEWuH9MkIo7i2kpmLKblCWqueu
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_051207_860302_7257CC29 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make it easier to have optional tunables by tolerating NULL entries and
doing nothing when one is passed

Acked-by: Sven Peter <sven@kernel.org>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/soc/apple/tunable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
index 659323839171..e89e8f9bb455 100644
--- a/drivers/soc/apple/tunable.c
+++ b/drivers/soc/apple/tunable.c
@@ -63,6 +63,8 @@ void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
 {
 	size_t i;
 
+	if (!tunable)
+		return;
 	for (i = 0; i < tunable->sz; ++i) {
 		u32 val, old_val;
 

-- 
2.56.1


