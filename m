Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F2606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pNd0QFoZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kp4p3hUx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=; b=pNd0QFoZqW7z0K
	5KbzSUlcJ66/tfRNQnscAJmBqtx4Fjda9eJTlGRUspuQsZhaPhOReiq3dsq8nD8ApkaYTuMHE35jQ
	B0TndJAxmaI+skro3JM2XBg07xSMf2qeJ20iA9y5ATaruuz16jeVomvMnjo3oL7RSMLHKDOgrBG2e
	hYkV//IiV6TThlfRNlZ66M95aLN0CWsfZPles6JlG4LkYt2wjwoSW9Cl1orjOk9KWkKXywx5eRBMM
	9UlUyfFv1RHkX73doy2KXMACU/8jE5GukX5mxj9SKhu5wV2bjypsGhJR9islqjxfHFq055oVYRuO6
	FzUZopTIigXdjkMswljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIm-0000000HX0w-0w0o;
	Mon, 09 Nov 2026 06:56:24 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIj-0000000HWyu-16rC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:56:22 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-14394530ec6so603458c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207380; x=1794812180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=Kp4p3hUxK9COdpAojW9CAXbjxl9UssDZ/e4jKPKyo5plzRQOqXNuG+Kx4qOKSr3Aoy
         UqZTlnK9bxseMq/TRf0cCzUKWrma2EslBG83vqsjZNHKKz2/ywwj+XCdtrKD5C0JioIH
         vBQAZMZWGr6m2m54O8f0snHCOguWnZMQMxw0vF8QWs9Je00Ywhmes4wz3uyLMTqKRTjY
         Y0g0xuCaMJWVCC/m1V2+gKxF9pIIOl9HJw3h+nOhD9wH/bO/eCNWjD73p+KIyd893Ssf
         /S9+LEvBTt9MHMgTVUeXe4lIuXcztARaGn4iQYUKEKczUK5LW+/VYEWyeO3y/4gkxT8g
         wr6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207380; x=1794812180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X72fT8j3aTk48j/y0v4w7hMGoPZwDLH0NPKuxge34uQ=;
        b=vYLrq9rpYbRErqyxgAfhCL5Yy75qNCFc0ilXV6ixRy3JIkys7GKrZAkW2WF6dgcZ0H
         HKcaW26s3K/hI535jmu8pFbCk9e5G0vG0b1DkIAic3vxHKjLnEzBszXbUfO+BHXklnmL
         tJ8mGpcfTxPf6vO3UO0/XYkhrECWzaAfEMDFdENS/tSFtUKf5ky9CIJ2QLfnSMs7hpQ2
         cMIqKoNt6fVyZnxgPsrGOjkkTpHL1WPBJ4RhVNyLH5/uv9BHhKIYkmYByGztJpjRqWYd
         /Nruh5Eic5R+rTydgcIemizfDVgWPhLGxdjTcWMDt3pesPRZfquEbcVjngbVDnlL4uLu
         UmHw==
X-Forwarded-Encrypted: i=1; AL+hErHgaIDf6dOBQkFXywvaSR5RYnSeCch9mw8gz7Hs4yfsO0dFUhenapGxrqsllbLamyqld4YKMrCc1lkkA88RBcJd@lists.infradead.org
X-Gm-Message-State: APuU4Z8tzpbqU/IKsZz3CyY3gMQDrGlKHEdBk1q746FuThI6vgewWLa1
	cmRgoZpm0CW+mAl0IIl19y3eRxgmDQxs9xjlFiRUQHd1/thn9bfd4vzT
X-Gm-Gg: AYBFou2nIHuQFreSxbuvjSsVQCRM4rOIUMyEvyzkXIhGp9ST2Ez/k6cE76/MJsNyNRb
	cTlfmGVjij3zt7f3ZVhd5DYchKRTs83NPDB+WI8HbmszeMAqaP/xpkGsWpLwpYhPDLmsyTYB1/e
	DaxUWlukQH7Yksnxj4iVsc0IHGGDwYVQUSIQac8JuhunQHkzWZx9V+rLxB94zEVMXXP9E4aV8Qj
	lzIHUker+QlwmuXXaZac5jx9F+dmOlFT0eCgJ3lBNMiO8CMMDevazcRcEY6NQWtCEByjsm9QR+2
	lsUSN5w/A3RbWdUzhU4+HQqHqw9EltDC7EjWj/dpc5EwM6nWwp787+lCA837BFFj4HLzUbtcs4P
	PiPqk56ze1gfeR5j8Fnguu40HADYbEi7117FKxERnzTdJNGnpw17KOAul7KsJ5r+Wf6koM/VsYH
	ZzG5y92TM43G1lLrNZ/rKtpCzSNagxjVue/FdhRILh+WSbSxaYaCBjqeMbu96I4qcrVYz1Vb/vJ
	tYosfqvsb8lCHMrF/WllV2/WJNHAxQS8bMPOc8XQVwCD7NJFqWKs6OEjagHVUsCT1kvfScRJGSB
	u/WYXzG6k6K2hFcOT8dAp0zMDCE0y8THypM0P66ElFATqYpZ3gKAKcbeWTZNfPWrYVl4+uXMypt
	Gn/ONif/SJUgUsPcaLQ==
X-Received: by 2002:a05:701b:465f:20b0:185:8c9f:de82 with SMTP id a92af1059eb24-1b39fef4183mr4962866c88.33.1794207380042;
        Sun, 08 Nov 2026 22:56:20 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:19 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/4] dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and OTG
Date: Mon,  9 Nov 2026 14:56:03 +0800
Message-ID: <20261109065606.62641-2-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_225621_303912_55F4F827 
X-CRM114-Status: GOOD (  16.96  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MA35D1 exposes two USB PHY ports (PHY0 and PHY1) managed by the
same hardware block (USBPMISCR register in the system-management syscon).
PHY0 is shared between the DWC2 gadget controller and EHCI0/OHCI0
through an automatic hardware mux that follows the USB ID pin; PHY1 is
dedicated to EHCI1/OHCI1.  Because both ports share the same register
topology a single binding and driver should cover both.

Changing '#phy-cells' from const: 0 to enum: [0, 1] lets consumers name
the port they need while preserving backward compatibility: boards already
using '#phy-cells = <0>' continue to validate and function unchanged.

The two new optional properties:
  - nuvoton,rcalcode: the resistor calibration trim code is determined at
    board design time to match the PCB trace impedance.  Both PHY0 and
    PHY1 values must be supplied together when the property is present.
  - nuvoton,oc-active-high: the over-current detect polarity depends on
    the choice of VBUS power switch.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
index fff858c909a0..1bd22dd0e5fc 100644
--- a/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nuvoton,ma35d1-usb2-phy.yaml
@@ -8,6 +8,18 @@ title: Nuvoton MA35D1 USB2 phy
 
 maintainers:
   - Hui-Ping Chen <hpchen0nvt@gmail.com>
+  - Joey Lu <yclu4@nuvoton.com>
+
+description:
+  USB 2.0 PHY for the Nuvoton MA35D1 SoC. The PHY node is a standalone
+  platform device that accesses the USB PHY control registers inside the
+  system-management syscon block via the nuvoton,sys phandle.
+
+  PHY0 is the OTG port whose signals are routed to either the DWC2 gadget
+  controller or the EHCI0/OHCI0 host controller by a hardware mux that
+  follows the USB ID pin automatically.
+
+  PHY1 is a dedicated host-only port used by EHCI1/OHCI1.
 
 properties:
   compatible:
@@ -15,7 +27,12 @@ properties:
       - nuvoton,ma35d1-usb2-phy
 
   "#phy-cells":
-    const: 0
+    enum: [0, 1]
+    description:
+      When 0, the node exposes PHY0 only and consumers reference it
+      with no cell argument. When 1, the single cell selects the port,
+      with 0 for the OTG port (USB0, shared with DWC2 gadget controller)
+      and 1 for the host-only port (USB1).
 
   clocks:
     maxItems: 1
@@ -23,7 +40,29 @@ properties:
   nuvoton,sys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      phandle to syscon for checking the PHY clock status.
+      Phandle to the system-management syscon node providing access to the
+      USB PHY control registers.
+
+  nuvoton,rcalcode:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+    items:
+      minimum: 0
+      maximum: 15
+    description:
+      Resistor calibration trim codes for PHY0 and PHY1 respectively.
+      Each 4-bit value is written to the RCALCODE field in USBPMISCR and
+      adjusts the PHY's internal termination resistance. Both entries must
+      be supplied when this property is present; when absent the hardware
+      reset default is used for each port.
+
+  nuvoton,oc-active-high:
+    type: boolean
+    description:
+      When present, the over-current detect input from the VBUS power switch
+      is treated as active-high. The default (property absent) is active-low.
+      This setting is shared by both USB host ports.
 
 required:
   - compatible
@@ -42,4 +81,5 @@ examples:
         clocks = <&clk USBD_GATE>;
         nuvoton,sys = <&sys>;
         #phy-cells = <0>;
+        nuvoton,rcalcode = <7 7>;
     };
-- 
2.43.0


