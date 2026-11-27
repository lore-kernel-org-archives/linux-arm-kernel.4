Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A109606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 08:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KTCvHHzR;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=ODRjKCOG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5+4WWMGxQZEZwgmCm5Go6TCy3m3YHuZQuM4Z32rUfXE=; b=KTCvHHzRMBqS/p
	O93iShYLZ9Wqzw+P+EpR+KE9loVJSjcoUboXII44JtrG9DUlQezZcBcZ2yqptFYkpSzCy1v+q+qjU
	UajNoTc21ZDgiwlAi7ReAx4elMATrvwIebRFolr7eYI+hXdRhgpr41pPiX714vTtBrFWw72btp3Ql
	3JMULGSvuA11JlVqbuvpLH1ylOFfzuaAmx5grmrLToVxC84bL79FYdaPkZ+fv9rs6dZ6a2McM8fYQ
	tvFsFUcue6havOrLAz4S8ZxPCuC7DJy6P8R6kACH/cwiEByMM0eLCv4F9QRvF8hdKZVXdwrwXPZfm
	niJC70gM2zZxAKdIr+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqz7-0000000FE9X-0AAH;
	Fri, 27 Nov 2026 08:07:09 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqz0-0000000FE7T-2X1T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 08:07:03 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 909534C979;
	Fri, 27 Nov 2026 19:06:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795766815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+4WWMGxQZEZwgmCm5Go6TCy3m3YHuZQuM4Z32rUfXE=;
	b=ODRjKCOG8mpFQk6IQDfrwcfRKrp4wvILiOuH4J9F74evzSwb5hfcIz4XfvDBq6m9YbdYa5
	a+80zMmC1UlgjtpoLfYwCU8xOsXBiB13CIUHlwHPvDofuIM0mjWdbm0V3/RaXwDFN/C8oZ
	hl+D4QbmkvxduyDrWzPDiSbGU8IdIsJVEXfLw7c568UaGVI2431JtpAIo+wsFtpRiWumzQ
	yyaE+GXf3XAuRx7OlkkIYVgpq+bP1ShPfQ5Vx9x6VZ1cWEBJYzJS9tMwmWI6tDERyifZDK
	Bn3ZPZFI1LR3AdQQr9A5y5h0XDxgzrkupigLw1O+dE+2NOdz2JMnE6eZgRJ5gw==
X-GPT-Reason: This is a legitimate personal/professional communication.
	The content is a technical patch submission (Linux kernel style)
	for a display driver, which aligns perfectly with the personal
	mailbox (alastair@d-silva.org) and the sender's identity
	(alastair@d-silva.org). There are no phishing indicators, no urgent
	scare tactics, and the message lacks any marketing or malicious
	links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Hans de Goede <hansg@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 1/3] dt-bindings: display: simple-framebuffer: Add Allwinner DE3.5 HDMI pipeline
Date: Fri, 27 Nov 2026 19:06:47 +1100
Message-ID: <20261127080649.1982883-2-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127080649.1982883-1-alastair@d-silva.org>
References: <20261127080649.1982883-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_000702_792047_ABE99BDE 
X-CRM114-Status: UNSURE (   7.47  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the de0-tcon-tv0-hdmi pipeline for Allwinner A733 DE3.5 HDMI output.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index c627ec088434..350cb075f055 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -131,6 +131,7 @@ properties:
   allwinner,pipeline:
     description: Pipeline used by the framebuffer on Allwinner SoCs
     enum:
+      - de0-tcon-tv0-hdmi
       - de_be0-lcd0
       - de_be0-lcd0-hdmi
       - de_be0-lcd0-tve0
-- 
2.53.0


