Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C3606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p/d6QuT6;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZDYeg+VD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dlyM8LZ8160Xk/WGiZ4OTZ6xlqG6xxxO9wME58yDA7Y=; b=p/d6QuT6LnGWmM
	Hu+tPDXvuYDZxPAi8nxuJ1Vn/rg9QReGrzPb6Gj5YudLas5RzNJN5cI92jQYJS4QDKPfWiY81+C3f
	xKRuWUNyYGJW1pM22Zp9lPqe/y8v3cnCsMDRzEF8/LHZIKMAqiWxo07WcGZhwG/gcaZ9gQd7VcFMa
	m4P/wditDuAL/qpQzdANwe1TXVhfOgydTec3Vc9sAlKsqcJ1huXUYyeFqzpfzIsgeAQAgo4f1w6Tg
	CFl6IZAq4w92soVhq9HBcGQgQPoMKTB+kB6ZqDakfCp1KdENtlzxX/+oMBt47HowGVmRNkHs5jhLy
	tuzRUSPqRvs52oa8dytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXiq-0000000HO7M-2U4T;
	Sun, 15 Nov 2026 10:44:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXio-0000000HO5s-249U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:44:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85A3E615C4;
	Sun, 15 Nov 2026 10:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D111F000C5;
	Sun, 15 Nov 2026 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739469;
	bh=dlyM8LZ8160Xk/WGiZ4OTZ6xlqG6xxxO9wME58yDA7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZDYeg+VDf14irn2wv54QCZHpkOTAS7zW/xAKbxkEILd1biV7FfJVGOWGuQ5ElGz2H
	 fNA3arw5CSrWMwuBlGWzUqMnXkV5ihPbH6vc7+K6rg0dH9uW98KyfKorIowTSitaOs
	 dLzOvg8e5CB/SqYNJ+zGeEFYW6mpU+aXwi2GLVVcK0+f4GKPqFEXr7iz2jayKqWsK+
	 dI0rDCw0SX1WxR8jTsXOpic7NCmmzHJt+ffyTBul/Qb7wfqxTRO+TY+2CERSNVTQuy
	 WL2Pf11NmAiWJ4Ne7W+jt1juyzWg4Vd6njJPODP1meUKCWOozba+VQP6XD4fcBWabt
	 2V9eOroVWgKgA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 02/13] pinctrl: berlin: use u16 instead of u8 for the offset
Date: Sun, 15 Nov 2026 18:23:41 +0800
Message-ID: <20261115102401.3520-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
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

The u8 may not be enough for newer Synaptics SoCs.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/pinctrl/berlin/berlin.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/berlin/berlin.h b/drivers/pinctrl/berlin/berlin.h
index 231aab61d415..7e7096842eda 100644
--- a/drivers/pinctrl/berlin/berlin.h
+++ b/drivers/pinctrl/berlin/berlin.h
@@ -17,7 +17,7 @@ struct berlin_desc_function {
 
 struct berlin_desc_group {
 	const char			*name;
-	u8				offset;
+	u16				offset;
 	u8				bit_width;
 	u8				lsb;
 	struct berlin_desc_function	*functions;
-- 
2.55.0


