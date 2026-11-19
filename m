Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD7A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QgpglTJT;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=UFLi/6eK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ci8p0AuX6stL6MXjMcRS6hMt62LWZGMpMiLOfGFW2gI=; b=QgpglTJTdYb24U
	qimK2bFakc4yQvHIHTrZpl9z4yBRBV1EzWtoJQfFEPRB2zuq5MtqkOAGNIQFz4H6Ci8yTENExUkbu
	+RfLUQXyZMmAi7Hvwv61bb91pPzPOY+/uDAwfHrIOMRROO2rSVaqYfafO125V5BHeHxmXvCjOcBK/
	m4D6ChJXVO6d+mj47+++MhBv2ovVNn60tQvGIGA9qFIgo1vSZfmsExRvH5RzMm/IZFAP9LuOvD+o2
	w2l2FCZFvbSCnr72Ctruh7loLcI9aPdFFTIClqD42Fw03Bmdq92mh0OFlqCQFk2mHsLxnZtygxZUB
	BH+MwZ9Ng6IHGlBh5qQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nV-0000000BxK3-16q2;
	Thu, 19 Nov 2026 13:03:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1nR-0000000BxHO-3gD3;
	Thu, 19 Nov 2026 13:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795093402;
	bh=NcbY1Kwj3zdv2Zy0vTw7QH7m4EmoNY/fT3JfB7rg+pY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UFLi/6eK4QpPXFew3S/yByKSPQZ+MYlEvNo82jSUO/hcIm/rP/eI9Lk1L5RqRZ1sr
	 CgOorXoWggbkk5OXYZpwdCKUv+lmfuC2KTPD3p5WnPJKO9rXkQHzfJq+TYgWIAJBFn
	 pXsfHHRcFWM/tm4cDiRDF4DSzGH1fQ4H+e3ktCd3I2XhspXuw87yEdH+kCPwF3crr+
	 tyZyvfI6rRRpUy+DeI/aETQOg2FCkPIhFHZIl4vWqSKZ9eUtYfDaVTOwBhqt71oZ9P
	 kZZL2BWAadgwWyLJJ+/KOdXMB6X/x4sT49jqv074etdrqnZDfb/oRizOrgdNm+XPD/
	 Q+kMfHHDOrgLg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D62B517E0BCD;
	Thu, 19 Nov 2026 14:03:22 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 911F1480030; Thu, 19 Nov 2026 14:03:22 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 14:01:52 +0100
Subject: [PATCH v4 02/11] dt-bindings: devfreq: event: rockchip,dfi: add
 rk3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-2-517a68c008fe@collabora.com>
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KprlhcFVeTBpVsP2HF+tCll/JPahCV7NR/zzegHDw2I=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr+85oA6DA/KhZxvFcKYJ5gL1mhn4HeSwvCx
 38LX/KkPvoaiokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/vOaAAoJENju1/PI
 O/qaDbwP/0lQqVCYl0oxQiFuNhuSiyYsld8IEQnHlAwcULM/44a9U2tzPaBOeMtjMNpuVYaTAe6
 y5ZagRXGRGJi39xPcEUHGjREy5gRbxVkdnymsSt/KPQH+jqowW7gS18KABDqxG4YCHhaVSyqsdD
 oeuHECraLYfWIeZr9971gE+Jq44flvUcTUuv8f0hVnDT1wCVhO/M63J0Dq4Tua2ELrd6TkMaNBK
 mSTDYL5LjAwvtU9L+fm8hUeO8ZL02CNfFxm9DoDCXt/NPs1Yzbee21P6WFqZCtaxaMedcpRLKeB
 f97/kbliJ+xoeV6K2YQ2T7F+nkC4PhJmzO0PEddezCSatCbav5VWwyxgyYDjwp1Qs/Y/ZxcPkhK
 K0F2eI0gv14pYns+n7518wPWt7wT+XpckUx6CphP/WlwZ9qwfXHpHNaUw1k4A4Ftm/4bHX8MYWS
 b0NI33Z9kMv95poWeLPSd+/FqKOoKiOnGhTfHiwWAL1Gst8/y4ZGbtdQs2dp3aKQFAEV7nF4QLi
 7fw86hk3zyXC+hJ1hba/GN7Ix+ZoHkcWJCTM6qcIBhprTOQHGe68jNWAp2mExn9OeSBmtcDLguz
 uBZHNtVGVN7/h1ERQzT53JCeb0tY5m/3SCgPA6w9Rdhn53ADGNdgW943mWjQDR4+DDAq3HirFyW
 uST5cS2l+aQk5elvwc/ggKw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_050326_107924_CD4C68AC 
X-CRM114-Status: GOOD (  11.15  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The RK3576 has DFI hardware for monitoring the DDR's bandwidth much
like other rockchip SoCs do. Unlike the RK3588 however, it only has two
memory channels, so only two per-channel pclks for DFI.

Add a compatible for this SoC's variant, and add it to the conditionals
at the bottom of the bindings file.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/devfreq/event/rockchip,dfi.yaml          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
index 3450e28b4020..dcf3bbde3e8d 100644
--- a/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
+++ b/Documentation/devicetree/bindings/devfreq/event/rockchip,dfi.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - rockchip,rk3399-dfi
       - rockchip,rk3568-dfi
+      - rockchip,rk3576-dfi
       - rockchip,rk3588-dfi
 
   clocks:
@@ -64,6 +65,24 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-dfi
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.53.0


