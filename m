Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524C3606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aEtGGS2O;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=R2lKm9Fv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=; b=aEtGGS2OJQlDwP
	7XMnU9GV6sB0tGUk7xGpaQJb29yzaIw0twfKGOxp4yzHF+N7VhSeBeV232mD0a3tqdLNydAZsLNI9
	9Zwi5YxNqWu0m++2GovKS77nsjN+UHro2Z42A6ObdvSrj947TF3wxYsbq3e6SKmvb+mqwk51sCkNs
	gdEfT6zhCs0W04q1FsxJtSLbGuSaxOFFkjQorhqJDPuYrxxS6eplxtXF4yQS69eZmJ7sQfk1eRSHh
	+u4UF1KhRxkxPYCIp+DyD81IQKsgofsZ7c6jMTP6QZlFtbE9F6Jl53WhVNnXEjQ41xxcAO62qah1a
	JUb7bhy1UNZQwatX4FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssk-0000000FW4x-3XeP;
	Fri, 27 Nov 2026 10:08:42 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWssZ-0000000FVxd-429P;
	Fri, 27 Nov 2026 10:08:37 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3BDAD4C97E;
	Fri, 27 Nov 2026 21:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=;
	b=R2lKm9Fv8PkvQg/ewGSztcOiQI4UZXZPmUC2YKQC6ywQMibApGivH/O45zacrC+KseXJsG
	P1NeO1jojdgD7mBvcl1ehd2PXosZciZzG/A29LMG2E4panA+OXsK6ZJQc5+vvWldQ36D1i
	gwPBBMtm3TRJRlETPaVY6RREKzgrT0La8VAsHnreLAGUik07+Tv8Kx2L4lSlXelrSRkgfo
	+CeU+RzTmfwCyAxD0eNtLXflcKRJa/yFU4hJNPdRkBy5PltCKJKLGFsC13Yt2nIYv0wHyj
	vQTDUnvuGPVWrRj3nPJkchLlVKYxVzuoPhu46KeyiasDvpK1KnWRGNKTRcSfbQ==
X-GPT-Reason: legitimate; the message is a technical software patch
	(Linux kernel style) that directly aligns with the personal/professional
	mailbox of the sender (alastair@d-silva.org); the From domain matches
	the recipient's domain, indicating a known entity; there are no
	phishing indicators, no URLs, and the content is strictly technical
	rather than marketing or scam-related.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/6] dt-bindings: usb: generic-{ehci,ohci}: Add Allwinner A733
Date: Fri, 27 Nov 2026 21:08:04 +1100
Message-ID: <20261127100808.2292229-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_020836_077810_F0959EE1 
X-CRM114-Status: UNSURE (   7.48  )
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

Add the Allwinner A733 (sun60i-a733) EHCI and OHCI compatible strings.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e..a63dc0eea80f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ehci
               - allwinner,sun55i-a523-ehci
               - allwinner,sun5i-a13-ehci
+              - allwinner,sun60i-a733-ehci
               - allwinner,sun6i-a31-ehci
               - allwinner,sun7i-a20-ehci
               - allwinner,sun8i-a23-ehci
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 7a8c3c231815..565f41eb33f7 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ohci
               - allwinner,sun55i-a523-ohci
               - allwinner,sun5i-a13-ohci
+              - allwinner,sun60i-a733-ohci
               - allwinner,sun6i-a31-ohci
               - allwinner,sun7i-a20-ohci
               - allwinner,sun8i-a23-ohci
-- 
2.53.0


