Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DCC606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6rUUGDw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bH62kWwI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b0GCcLLpnu5HRN3gNzYk2YRBIqJJI/7GK4gyMuexx2w=; b=T6rUUGDw0tTYWqmnhgjGRAFBEH
	r+X+EM9GErxoIjJxv6sGvI+fiyVFGN+17TPc3faUFZlSAxWz05wFtpR9VRB6SgBQs5yKSenfROQf1
	gtKEe3nwFomgp0x1IRGnBT0XSDZW0iaTO+SLL9OgURxjvz2i1DMjdrTEAkt0cgPYFfhBL0/O37RT9
	4ARH5Wrzk4BPPmJQSz5+7pIxhFKirkmFHNhFllcN+Ip4eXuflMN5OHsGEhpf04UpS2zZImaAAmAOQ
	0BB0wvaj0/VbayjYs8nsMr7Fti3XEWJmgWBdwJhEK8Q9Bf0UanAT1kWFYct6CZglYPmLsNWiQ0maL
	YJzEP0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijm-00000000eAN-3Gwo;
	Sun, 15 Nov 2026 22:30:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijf-00000000e3h-4BJO;
	Sun, 15 Nov 2026 22:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBE0845965;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=Sy7cS2pRRdtaYDIdjFphYflyJFZX1fJ6JWvAju8OsEwKfxV0CsOzFHjsJ3Hst8winG0/
	 AiEGNKkHTn153RmGLPR+9AWpDX+SF8OtSrcTugBBQfXBDwQAyJQxrkoITVJNIDAeiz5EK
	 q0wH7tLILU1J4NkN4EMUhk3s/fnVNq1SYFPlPc87fLDAXw4LDu9HTduFypcysr6pokgEV
	 ULI6gGHTqQHoNV87F0xulfYCpW3isFTS6QDOBhARi9pb9LpzU0oJP1Vlr1FTHJ7m8cD+I
	 kWbDI6bx5Dx92k6YIfEkw0l6SBnCVWXuAPWeFj3AObOB1acCtKEquBu+8rndU5hp/sg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b0GCcLLpnu5HRN3gNzYk2YRBIqJJI/7GK4gyMuexx2w=;
	b=GetrdkwtdjSQZkPH2tmvYIso8xOvxD7Z7YZWx8HULFXdJaS1LtPQ09ptdnZOBOq1ERTz
	 liuUKE5v9dWL7MGkwXS88KWEUgCe+RlIY0O5I//qmcOBLOJNnZp/6CG9jeuBD/QhAsJru
	 O9xJkoJKXJYJMyrvt2DFicRYQXJzw23oBQU9Z7ar2U81OcnmmUsT45J00lflDd8qALK8N
	 7wy5yk1+nw6IQEQITyFKKr73DM2gHqVZVw23uO9ua0UE5tyQVyNJv4UCWSbbVMm1cMq0k
	 F10RvRQvxUwY66QmCEEYyUhiAsBaYkr4FX7kEmodd9WQaITTJThqAS/Duk1k8T3iZ6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BFB81F000CA;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=b0GCcLLpnu5HRN3gNzYk2YRBIqJJI/7GK4gyMuexx2w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bH62kWwIBk+b0uvu/tqck1rDQiWWeucsTAosCcM3a0Oq0Thm3KdOypvVNcjsX5CFy
	 npei4pt53rW+JSyNqq0zCa0K2xVM4E4YytZnMuGAXPjMJEJtutxbFfAJPwCeodeKfq
	 /G+uRlXfmqA9BMbUOcFBVfvTWX7DqEPQFiwhi5yzujjEpMLL18Kr6bN6wqiSmd2sRY
	 JD30ZcERXeymI0yMVW3tEMMH8cgL7GRGp8UAoYyTJwRL2NoYKGHPrx/WFlNt5gJbNu
	 BXwVKChV34KqOuT2v36D3k1OHxxzFlzGDpRRvK0ZzzroaRbM9dDo3DRs+Ma9WRtS0Z
	 ISmDPz4kO/FIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C6E904A234;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:41 +0100
Subject: [PATCH 6/7] arm64: dts: amlogic: gxl: Add ranges to periphs
 pinctrl node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-6-94cbd67a32ea@aliel.fr>
References: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
In-Reply-To: <20261115-fix-amlogic-dt-warnings-v1-0-94cbd67a32ea@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1812;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=1hMI3ZXJw3qfNf1tTeBSR9kUdcutW51GZCtHSwjf9SI=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo0xZy8cBK9KEZj/pL7pT1KdnLffd+XwC3yq9aRxzf
 t/Y19nTUcrCIMbFICumyNI/1/LEu8tHz3zdo54CM4eVCWQIAxenAExkjicjwx2XdhnDY4m5366F
 bW77sPHi9jCNni8u0wKvVi0otb+ebsvwP+jUB1d2Fi2FDZdNMyPdH2/0Xtc2ZcnZRstD5omeSuz
 GjAA=
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

Building the amlogic DTBs with W=1 reports the following warnings
for the periphs pinctrl node:

  meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg):
  /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg
  or ranges property
  meson-gxl.dtsi:369.31-780.4: Warning (unit_address_vs_reg):
  /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg
  or ranges property
  meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg):
  /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
  meson-gxl.dtsi:369.31-780.4: Warning (simple_bus_reg):
  /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property

The pinctrl node has no reg property of its own, and its empty
"ranges;" does not describe which address space is translated to the
children.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index f257fe3860f7..59e7c6bb31e5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -147,7 +147,7 @@ pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxl-aobus-pinctrl";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		ranges = <0x0 0x14 0x0 0x14 0x0 0x1c>;
 
 		gpio_ao: bank@14 {
 			reg = <0x0 0x00014 0x0 0x8>,
@@ -370,7 +370,8 @@ pinctrl_periphs: pinctrl@4b0 {
 		compatible = "amlogic,meson-gxl-periphs-pinctrl";
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges;
+		ranges = <0x0 0x4b0 0x0 0x4b0 0x0 0x84>,
+			 <0x0 0x430 0x0 0x430 0x0 0x40>;
 
 		gpio: bank@4b0 {
 			reg = <0x0 0x004b0 0x0 0x28>,

-- 
2.43.0



