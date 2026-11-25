Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5F606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 19:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tjuOZFOj;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=ww8kuy6d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=; b=tjuOZFOjOrI+EM
	VYBTULgUy4C+YJOT7yHlUKntDqe99qco6Bndj8EQ7CvVQ6Et0W8uUqwU9UYzmJSIJofDUcrI+PC6x
	gXGKwjWmuPcH+HWuqwgiQoKHNECuA3lGPAZqU/t00sHKvKcBhBIMUcJQqwex/pNpsAq7IJuq49h3K
	1KfCudDDqQfV5u20dXSjpfaVtWH0qez6b1MVwH6Yk6WR96DvV+eSAoOvAXk/hEDHh6uTVnwP/TUu8
	BMG2ChZyygubWi9FD8HMCmYsUNYOvncT6so7YB63aXrjVM0RzSZ0/z9WMpBBPMvaVYrUBMw0ms6f/
	eSChQkRytY32v0uHf0HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInl-0000000BA3K-0j3m;
	Wed, 25 Nov 2026 19:37:09 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWInc-0000000B9vS-22L2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 19:37:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4bb61185057so40257495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 11:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795635418; x=1796240218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=ww8kuy6dbKIK3VD4P5pJyjlJEYChXD+D6gQprL/J/FVEloG3fYJloWt7PjNwl3v9vF
         X0TNAxs9iNDX23l0AT8lnovIooEgvUYLytvlOjmBWCXI1+JJrZZDFKp+16pZn+fE1tLq
         EDqBL3/2n+ClMP7sm0h0vTN6LWOS++jyqoUxkhQgr7UblhlmS2WQai37b8h7svAd9BVg
         x9QqBu8vJKnhDwXkNlU0JeuZVes+sg1v50S9ePzsBzoOwpsGs3l9i8xxe35xv4EBs66Z
         mzSMsDlVUU9h2ROkynXO7k6PVGNoOJ6lpCSTXh8f0flBrUsESNo0dKHqt7iKBV75NATv
         vqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635418; x=1796240218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dHDItMaeQju5JCWIsWfsyYtjyVRkZnaMexPksVcLO0=;
        b=mRrlLHAaisiFchhU41CbW9Cy1pfNl/DhOfiRiLzgX/Xm3bdSjAbUV7v9dLRmC5wfG0
         q7S6h+Ctk2ldainthIPErTQzkWh8iTDuQsSQ2dn1mbiQj0+isYFeuMNRgn5WWije2wtD
         pIvpHn4QXgWnv4Wv/J54WfkD/0icGmcTvvacoGd83hCFspIZ0z42HIO/xYkyv2scnUwy
         wDGAlnK6RGP/BsBPlBtepbKFlpd3jdYN+/qi66h4PosIIh4HHHg5OvTy8WXoiiOVOInA
         4zFdbIgusP5ltLxTsdMiH3koy50eLYqyAc/aEAJkRQyCNItSaklVOYO/ojEGmtS/WEdU
         bxDw==
X-Forwarded-Encrypted: i=1; AL+hErHo+5dabDuwOeF3lpQNZ1T9GY4adAhUo6BozmqIS9zul0ekDKfXuNVeBkNbzHlBirbzU/KkaYbRRLbxZcWS+k0k@lists.infradead.org
X-Gm-Message-State: APuU4Z9RhpwNJ12BDNAOmYsSpATaCWtIFKEcUCxSjC9hf9EGy2BcLJkc
	FhoCUrbFIWak+Btmd8NkCem5xvYy8PyiAVgsiHoshwoQUPeh1du4V/cTBq3ME/F8XLQ=
X-Gm-Gg: AZFdTZfTCWtJc3ovULAhBALUXFV94MkjSPM6gGIHR1QsNnbgYWifxv3NYqQd5V09hH4
	/JClQvXrocWhS2vxqPLZTssC2ZCzpb+bXO/kDaakfe/3PiR3NJcJNx5tMU25wt8MFcs28VlPPLQ
	sXP6wxlXWzv0j5nD1janBxmAKuDVZVrIo9guO+b4z2JwwEOjete9GEXr7X90hfzxyogbHzpgYI9
	Wx7FQLt5eN17xLrNEyb3xaHotOa6EFzD/vLvtvPqnImfRiv6Io51xDRFU28iMD4wBww/KkHGq/T
	+GxjZD/rITp3iB5caAtg9IJi4bDEnpgQtUyznZ/23g1058+pKofr4ovMbM5AxZ4InD4Hqyg0Wdc
	Ic22xX8/KnNmqVYspxke5RzWv9OwP05bHRyjVbSSddPhFb3d/G5/Y4zbaxpQQ8JHeuzemx22gZU
	NtVbi17f5XJktbG+25Jmy9IVdloNumssHlontKpmhdS9y66N3/9OXn3WiFLSkJlfFMZWWgAU/lY
	E95xAP91nnz+vOQKvfL64xSFysiqD/9PbSaEM6DThjz05NBGvrux9uyn+e5gtpyQGmqFdgf2dPB
	mDWjbFbn2eLV4JJB4Pfb+cqh5CF7OXXgagfIvv/ippMczhgmbZqw6s1SWLptbO02MmAz0fXzjGP
	8pZhX9/hsxw==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr446216865e9.9.1795635418569;
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm35614063f8f.49.2026.11.25.11.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:36:58 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 25 Nov 2026 23:36:39 +0400
Subject: [PATCH v5 2/5] dt-bindings: net: ethernet-controller: Allow a
 unique ID NVMEM cell
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rk3576-otp-cpuid-mac-v5-2-b3125c9a5fc8@flipper.net>
References: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
In-Reply-To: <20261125-rk3576-otp-cpuid-mac-v5-0-b3125c9a5fc8@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Willem de Bruijn <willemb@google.com>, 
 Simon Horman <horms@kernel.org>
Cc: Ryan Leung <untilscour@protonmail.com>, 
 Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1744; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vohlOi2XU6LEq2ZrdPzPMNqYE1lULtEksPUJLyGTL0U=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSzW5wVOvtXI5DPOV69QviV3AfGYF0Wm3t6q4vsWNzaX
 E+vmfe1YyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmO+szwV7YmkO23fLvLrG6jBWHdcyaXWU/SVY17Nf8mf0Z7hJ3pNEaGfVxrrRM
 s2XIeNe94vVf6xs7JH9xLtgvU/Vq/8PuZPvZlnAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_113700_552968_B32B3D9E 
X-CRM114-Status: GOOD (  12.86  )
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

Boards without dedicated storage for a MAC address often still have an
identifier unique to the device, such as a SoC serial number in OTP
memory, and bootloaders on several platforms derive a stable MAC address
from it. The device tree can only reference a stored MAC address, so
such boards depend on the bootloader patching the derived one in.

Allow referencing the unique ID as a "unique-id" NVMEM cell instead.
Leave the derivation to the binding of the referenced cell, as it differs
between platforms.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/net/ethernet-controller.yaml          | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 30b2a335116e..6966270ff78b 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -24,10 +24,17 @@ properties:
   nvmem-cells:
     maxItems: 1
     description:
-      Reference to an nvmem node for the MAC address
+      Reference to an nvmem node for the MAC address, or for an identifier
+      unique to the device from which the MAC address is derived
 
   nvmem-cell-names:
-    const: mac-address
+    oneOf:
+      - const: mac-address
+      - const: unique-id
+        description:
+          Identifier unique to the device, such as a SoC serial number, from
+          which a stable MAC address is derived. How the address is derived
+          is defined by the binding of the referenced cell.
 
   phy-connection-type:
     description:

-- 
2.56.0


