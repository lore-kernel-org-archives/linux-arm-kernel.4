Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4871606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeYOaG8b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwWHI3lF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=; b=QeYOaG8bspqZp5
	TcMrFS8o605MadwdHaI19MEwOWN6zvHpsy5FET7Z2GVmj3lAL1oXIKmrGOHJGxbPPvarcKLjYpRrf
	Gs7qGAdn4MdVFexIrBG89qHW9njESdhwCjTzUrmEJS7b6xAJzPtPRUUzMQxXk22m+xgNYKdODu1um
	+ilMJPrX9+FEbRoiL+VMqa50nuGXiPHCLRLRsT2vmIO7A1C7TK4VNA1T7V1fYUu6+zKPsRpt6GYDS
	S48yyTcSDt215f3CuXThoM2lnWuEpeucMF5ov/f43nwny1mWpLybVsuyRwwkxKiaboFX5FYkxhCmC
	agKet0cMyoP2+VBRvIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LW-0000000CuHv-2jAH;
	Thu, 19 Nov 2026 17:54:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6LS-0000000CuFG-3gdP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:54:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so24347485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795110889; x=1795715689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=fwWHI3lFBnR5xqzbKYusvtPqRLtBIsjV2d9px9BOHZpxKAc1NxXvOMt+CuxxcRuyit
         VUVT8+JMz9WiCZWMAb7/Aql0jvgM4X1JZObaFP+XsCgXFtb6xEGsBjl91WpjkwDV/VHe
         O2v6zhy+jAHp98xUBmlkMue8sg2yrLHXRaBSjKWUaFoAFVNQN1CFnUUx7sVSITZXJvz5
         wVc6w26s7ZE7eMv0OQh3eSGmNhDJl9nI+l6jVNsPJiVA01Pb2hF8JlZ/kvGqVJ0Kw0u9
         7iW9GsyzS0xFanUYCGHDhbaUceXhGTqJgYg1lbs/lJHFU3rgulSuCa/nOIHgQ78cvdvU
         ntIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110889; x=1795715689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vt2sq8M4zEW0Jl+PkiArkaZv9si52iHkUjUxiJyG5ok=;
        b=bE5KppfAayg34EyVbAOomcMGI6ydH4EJxrAxd+YArD9MZ3JNMHuCg33DHZARziGy9G
         Ab4H+P2KQJKkQZFgN2xhNYvOYEejvo+OfhXSe6FkVsSe+e++ndPy95l8yj1dhxc0DXGB
         wX+CyXed17gjhkllzqcD338rKoDQWmBDi78hF7TsdxbVipd1RNYabWcG+/BJeeKtCUld
         WhfKP0bACkZOW8ib2RhyBZq/9N8kZ4K8PRRx55v6f8BlAJARlUZm4ETNQJFKioKFx31q
         qytqOoOzkYmd1W8xFcTOVija4XxtdT90dIEnKnpVPenLOx0EZm5Gb6Psu17GYOAWvZqA
         OG1A==
X-Forwarded-Encrypted: i=1; AL+hErHKwJj/KpngZE0E8HqlGDXc3/NTtN+iJPv2Efz/Bwnd92vcr+6suh7m27IHvkw/O5N+h3rf2tJFRw9cPn0e+voM@lists.infradead.org
X-Gm-Message-State: APuU4Z/oM+H0GRpjkQQumwVzCxYzI/hbIUeSdGI4DN8kBEITqsA6kGkU
	0An72LUNLCS9brQbxqw76D3yt/rh9hOEib/+Z7SLNfx/0RhDVlR1xBU1
X-Gm-Gg: AYBFou0oYWRYeRO/RMLhTD2oQtnmpCCMgzsIdjWq5R0PuKluLBJjVIVtSW6qXM/ISHL
	PdJ+k77ln36QVWufkeSMFDa/U9Qn9950OdK4ob5dFPNQHhMSg4zw0DIvEiZ1+NCsedGwn43y5zl
	i5cX9JO+FoLfwd8Jy4MUe2sMrvbEiXaiL0QDxDTsT0fNwapGLesE0tF+WBaXCyJU7U2VUMsrD/e
	3wNLMYSGt/nvdFYscqh3qGf8KkzAUz2cIY+axP+uYzvb6AXgojtgZc6Bmsv0WSyoa8ohB+pQfuF
	kFhGyEoKF3YpwBdqg35TIkU0Ffr8ZiYMzhu1EmKh7029cwvXhcO4hNCCX0GX8D0li/6nreuZGgL
	cto0I3buwE5TyNcY3eWZ16hG3moWExOhpoysdQXqbuyS0ataJW7W2l56k2HNV0e0p94obCc+LLv
	jXFJnC31WLHLH+RO3mMDB9Ov8RZ3irxatUznbQZZ4ounloJ5Jx8Upzj1tk3s4Med7bWulP0Fqh7
	jH3QomjXMqiaUJH5h7ov8xQrXx+S9OBlh5ubvrobhGHtLhVd0TcHuyyOUY3dO5ljqkLkU4g8fXN
	oG+eZz1RZjRN8WQyIgEBs2s2oSpfHu46oGgC/h1FstftmsEiJuGgxQZdr7xojk8Uc0LrZOtfaGp
	s40CSRZlccWxe8z0nB0FXX+5HlLpXVLN331lZWWwpWYg1F9bDuA3T8L+urSv62+7rUbvJbLZ688
	D4uWVCn2qRA4FXLwub/nECscfPBfr3M1LXKQmqok3NdPWuvoaxqMhjwaau8HmSFbvseHU7MBpg7
	KX9oggMKCMvWWAgTmKHIuhoFNhjKdVTOdDmGBWVgydd//yxLnh3fjnH
X-Received: by 2002:a05:600c:a11:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb88812c92mr5507015e9.18.1795110888897;
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
Received: from jernej-laptop (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e50512sm29390035e9.3.2026.11.19.09.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:54:48 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: display: allwinner: Split H616 DE33 layer reg space
Date: Thu, 19 Nov 2026 18:54:36 +0100
Message-ID: <20261119175437.2520400-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
References: <20261119175437.2520400-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_095450_944720_A8398FA2 
X-CRM114-Status: GOOD (  19.56  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As it turns out, current H616 DE33 binding was written based on
incomplete understanding of DE33 design. Namely, planes are shared
resource and not tied to specific mixer, which was the case for previous
generations of Display Engine (DE3 and earlier).

This means that current DE33 binding doesn't properly reflect HW and
using it would mean that second mixer (used for second display output)
can't be supported.

Remove layer register space, which will be represented with additional
node, and replace it with phandle, which will point to that new, shared
node. That way, all mixers can share same layers.

This change is intentionally not backward compatible and the old binding
will not be supported by the driver, for the following reasons:

- It can't describe the hardware. Plane register space is shared
  between all mixers, but the old binding puts it in the mixer node, so
  only one mixer can ever claim it. The second mixer can't be supported
  with the old binding at all. It also has no way to reference plane to
  mixer mapping registers, which live in display clocks register space.

- Supporting it would mean keeping a second, mixer-local plane
  management path in the driver, with hardcoded plane mapping, which
  doesn't match the hardware and which can't be tested, since nothing
  uses it.

- It was never used. Upstream H616 DT has no Display Engine nodes and
  the rest of H616 display pipeline (TCON, HDMI, PHY) is not supported
  upstream yet, so the old binding never produced a working display.
  Vendor BSP kernels use a completely different DT structure and no
  other known DT consumer (U-Boot, *BSD, Zephyr, TF-A, ...) implements
  H616 display support. Only out of tree WIP patches used it and those
  are updated together with the kernel.

The driver will print an error, asking to update the device tree, when
the old binding is detected.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../display/allwinner,sun8i-a83t-de2-mixer.yaml  | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index cbd18fd83e52..064e4ca7e419 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -46,6 +46,10 @@ properties:
   resets:
     maxItems: 1
 
+  allwinner,planes:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine 3.3 planes node
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -74,22 +78,22 @@ allOf:
       properties:
         reg:
           description: |
-            Registers for controlling individual layers of the display
-            engine (layers), global control (top), and display blending
-            control (display). Names are from Allwinner BSP kernel.
-          maxItems: 3
+            Registers for display blending control (display) and global
+            control (top). Names are from Allwinner BSP kernel.
+          maxItems: 2
         reg-names:
           items:
-            - const: layers
-            - const: top
             - const: display
+            - const: top
       required:
         - reg-names
+        - allwinner,planes
 
     else:
       properties:
         reg:
           maxItems: 1
+        allwinner,planes: false
 
 required:
   - compatible
-- 
2.43.0


