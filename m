Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9111606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ukFRMnYO;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gfyt/L77
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=; b=ukFRMnYO9LyL4mlZcLhFQWoBLt
	QiH0WQsQmaKby4JMOoOjXzbpyajhxjn83kR4AToxh4FQxVbyBdtZjBO8VVcBQL1T9LuU+gh7VmZj/
	9JKFakrUeUCqJWkv2n7QLChXG8CdB7Z1LZ15K5SlW/+osG1TB+aGBe9SUaEpKMugMCvjzcA1tLHVB
	crXwKNBFH4PN7dmZtkGYmlolFdLdc3KS4TucVPM/BTDMrcbRmUfk3FG9nxFYeHUaYMAbcURbhDpaI
	fA8n4Soe8OqK+I09sjeRPX/0chU263UiFRxkZo587WBg36L9QG6ggbU1ifPAlPHS5JP0/mo6s9uv3
	G4r317cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqew-000000005Zf-3Wwl;
	Sat, 21 Nov 2026 19:22:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqec-000000005IF-28tl;
	Sat, 21 Nov 2026 19:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ADC16612E6;
	Sat, 21 Nov 2026 19:21:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795288901;
	b=ctfSfYS1TY2jvfUyMCNYDfzcdnDpBPKatO6mBMP11yMwhboCtm9n2bBV5HGsd1fhk9UD
	 vxPJetIKERxcvj9UgYMfOL0Ztn7tRa11MsVi+7RnnaIxFq9J/5BzYpk7PCiJUFKdiVyHY
	 4+Gypr5wUFDnNuHBbu+Zx0ierX0A4icViCEd37ibf0Fezxc0dcCYinpZoXj89HsiMHqpQ
	 B5ZseMaLFVj3ROXYxQZZCl/LIe+Vc+g7Yih//SzXkQH+yFEZ9tp9EwduOWyCRNrw8S0JQ
	 HjeGG4/20slCd6pIgNHqPQJw5Omds564ceEx/nhH0avi6/nDrD/oYkxHdZajNCBapfQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795288901;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=;
	b=RauRq3OK9QdG1mAnA9qKIMYtY61/J0T+a8OoAkIJixY23ckjl4K6ZT5P7B5BrWBoUIOg
	 qUEip7dKNa4bJdpP94Fn+KiwK6IMKxeGrrpawZNtWBgrmPuMITH7bmR1rm4io7K4ptoa5
	 ZM4H92imTAhNxGYgAoVNAmn/sPQRyab6luyKmmLvnKsPDVOfylMnjPgLYUvfZLJrcF8wQ
	 g78naQToyq03ZNhSYfdjyOE0CFXv/eOSnRG+1g3N0x1WFHjhyK+ayrNaWVsAscP0ghXKo
	 bLsgahhmV/WXEji/DDQXtK6g/qmuwmcYlK+PMtaHWcO3ynoor/xdIUXxdrCh2poDt5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 552CF1F000C4;
	Sat, 21 Nov 2026 19:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795288901;
	bh=y8B3yYureNWw/gPn5TmCorzbaVWuAnwa7i0qf1DFZYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Gfyt/L77OPxb7XqRNZ/MwCIYKHrYVXemBPRFa2HZuINT36lD8tUqqNIkeWkLHcR38
	 6JXoKWolsTJMsSwp2EonhFEuG9C2HIJLojuVaD6VkHKRL5/lvcYW6+1U4UDIwOq6Eu
	 /4qkoL1Os59GOFRDjLDCKei2Sd8Ju5FiwussODQEYDvp1EcU/Iye9WXK98zbA8alHa
	 +CWQxh6oGS7gQaZuT8DLBa8hQ/Tw5Gi0clfEg1nQZXgXcjUO0877VaiFHKB0PmtHIU
	 xRwYbHPq/r/5AgmjT41W0ksLsuSB0o+z7YpoJZUDE/vIUwRrPF320j0qQKtvIR7RTP
	 W18ptZk+vW7gQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0AB564BD76;
	Sat, 21 Nov 2026 19:21:39 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sat, 21 Nov 2026 20:21:07 +0100
Subject: [PATCH v3 05/11] dt-bindings: display: amlogic,meson-dw-hdmi: Add
 phys
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261121-meson-drm-create-hdmitx-phy-v3-5-f8f471788076@aliel.fr>
References: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
In-Reply-To: <20261121-meson-drm-create-hdmitx-phy-v3-0-f8f471788076@aliel.fr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=gEM9bIkhQe1Q+n5KKc7w/RzPzlM5UABBv5gf7bLSb8c=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQzbje/3swz+nsmXNEqp/PnedSvyH3QLM0/bFblS9fGXyh
 VSlqsadHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBEeH8w/C9mudjWw7QsxKVC
 ernK1dDdpr+Zu9TeXrl45LxxRMnTD08Z/sqF3d80P/wUk4p7+ww3Pf73BSVCBWu9JuZH2a/vPnV
 lHRcA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

The HDMI TX PHY now has its own binding and driver. Describe the link
between the HDMI TX controller and its PHY with a "phys" property
holding a single phandle, and update the example accordingly.

The property is optional so that existing DT, which do not describe
the PHY, keep validating; the driver falls back to creating the PHY
itself in that case.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
index 416fe263ac92..7ece4ea262bd 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml
@@ -108,6 +108,9 @@ properties:
 
   sound-name-prefix: true
 
+  phys:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -136,6 +139,7 @@ examples:
         power-domains = <&pd_vpu>;
         #address-cells = <1>;
         #size-cells = <0>;
+        phys = <&hdmi_tx_phy>;
 
         /* VPU VENC Input */
         hdmi_tx_venc_port: port@0 {

-- 
2.56.1



