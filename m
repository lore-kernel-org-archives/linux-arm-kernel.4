Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eRWNzob8;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=YgP9nS5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rtQftuGGUMT19UNCIFYfUEwNelYK4ghR4wjdso4iJDk=; b=eRWNzob8u6v1j7
	K9M6vEuG1rEGnN2yC/MODpYjspUBDcDSd26oAFNatqv0Op3hOXqKouO8jNDN8NjwPeB2G/mtoUm1e
	jZEsidbyf3LbwVkfyu5XGxLx7hxfppzAAdP79QXJ4JBCAtMMk2CX4mtd5vh4YVVHY67BPDRW5Wsne
	UxfCZizit427JJaYrPUxoU94lHMyzRqDhVX0yIswvURoYX43H27gmAlf5soEi5cXF6vNInnuIFvZW
	WJi+/pb2qmQUVxtbPcCPKPpItPUPqDo/ZjMspLv9a9+VnFMrmvSuNy3GqFrCoj4ZDkr9ZLkYssAn5
	QTStKVUL87DBiN6pXiJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqS8-0000000F7Un-1wj0;
	Fri, 27 Nov 2026 07:33:04 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqS2-0000000F7Ra-223v;
	Fri, 27 Nov 2026 07:32:59 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id DE58E4C96A;
	Fri, 27 Nov 2026 18:32:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rtQftuGGUMT19UNCIFYfUEwNelYK4ghR4wjdso4iJDk=;
	b=YgP9nS5Xw2PLHP/1izDsqXbid+9uysE2KYSPPCwxLYOfFIZXZ3sEr5M9HunbX/Gcl3D990
	MktbtxR4YPUzx4/0yN3PcCxVi+RWcVrM59W0Ig5OaFMnnI3PrVRxF7L3/XeEqMJQvxWOgt
	aOWHVFDeENodVrsJelo87a3Cg4Iqf9LgKY723oCDDiP4MTVZTuHbtPSBOi6SLGN6GkZB8W
	kKJbHGrc1Tt3NiZSaSdLWcQlCL0zItyFuTNi3t9FsET4itG/B12LUo0iQhQek9RtYgbKGo
	2IXpb/ZvTmHnlysg22dBES3EIAf+LCxOCc2GyyfcbJstbSg8DuDzXo5ijoiSEw==
X-GPT-Reason: legitimate_personal; The email is a technical patch
	submission (Linux kernel style) from a known personal mailbox
	(alastair@d-silva.org) to another mailbox within the same domain
	(celia@d-silva.org, sagan@d-silva.org, or alastair@d-silva.org)
	or a related role. The content is strictly technical code documentation
	regarding "dt-bindings: phy" and "combophy0 USB 3.0 support" with
	no marketing, phishing, or urgency tactics. The From domain matches
	the sender's identity and the subject line aligns perfectly with
	a professional/personal development workflow.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 02/11] dt-bindings: phy: allwinner,sun60i-a733-combophy: Add combophy0 USB 3.0 support
Date: Fri, 27 Nov 2026 18:32:22 +1100
Message-ID: <20261127073231.1776847-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233258_671365_7458A87F 
X-CRM114-Status: UNSURE (   7.94  )
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

Add the combophy0 compatible string and clarify #phy-cells usage.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 .../bindings/phy/allwinner,sun60i-a733-combophy.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
index 5182884109f9..58e7a3348bd4 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun60i-a733-combophy.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - allwinner,sun60i-a733-combophy0
       - allwinner,sun60i-a733-combophy1
 
   reg:
@@ -39,6 +40,9 @@ properties:
 
   "#phy-cells":
     const: 1
+    description: |
+      PHY type from <dt-bindings/phy/phy.h> (e.g. PHY_TYPE_USB3 for
+      combophy0, PHY_TYPE_PCIE for combophy1).
 
   allwinner,serdes-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -79,4 +83,5 @@ examples:
         power-domains = <&pck600 PD_PCIE>;
         #phy-cells = <1>;
         allwinner,serdes-syscon = <&serdes_syscon>;
+        phy-supply = <&reg_serdes1v8>;
     };
-- 
2.53.0


