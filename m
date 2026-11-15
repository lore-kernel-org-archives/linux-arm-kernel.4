Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06D606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 22:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VqAHTieM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iFQBAC4M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=; b=VqAHTieMdl7ErhfcBr1qw+Nd9x
	fKllaxWzryWCJApgX9sa/hKe1H97G/xvtPJaRB+SDwradv6tdbCGYftdKVV2H+7r3qucys2OS0ESW
	pcYMaOLU55GKVFEDbmbSF2/KzNmv/mPPABI80b5c9rZtu1E4S+9HuLwxhDqWG5cJ1LewG7ZLKz+IS
	JjN3rLWLWS6mQTXJtwphfr6Xff6gozhAXnvPALYUI23t/lwS+ZKtjxAwVKQnt3swsYcscD/z0dHmT
	WkErpwYif11TrGonouBKY3V7MW3JcpujLRjh0bDfqJhN+TakmA/36+Mj9VjKiKy68N491fEZZN714
	Vs4mYUCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijl-00000000e73-2VTO;
	Sun, 15 Nov 2026 22:30:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSijf-00000000e3Z-3M53;
	Sun, 15 Nov 2026 22:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C81745968;
	Sun, 15 Nov 2026 22:30:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794781807;
	b=QBf+bc9vQjW9VzV+sf6qW12TgpSicc90MBBA3TXzgObXbn8E0i12petHtkjvTpemtDOE
	 e/de4lIhGK0gBcVqA45d0KOwFs+rOTGKpQLono6W2A6UYHsuPoaRI4ZTqh9yq+WAzwvf8
	 gPg5h5SBowY46R0NvQS8MCmozboooexmnyqjQNkE5dR4uIVtSh2nN7DDSBFX3npIxjRET
	 BtX3miDMCUpsF83PEJg8vw1MzAO1GJsnOzZeK9ZcwcKSf//CT1oTEVHb+845J9bYTwSMo
	 Pql1kMqTxcgGG+NvdRWpPgIZwsBZrV4pmBe5NwXpkmzz2IMu62qORjvAsKd44gOCcvw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794781807;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=;
	b=ETHWlLfNUphK3IzIHzZ5ZjKYfeUtYyIIdWcMMuXHa8Rf7r7nPRIjPeqmddY2X5GmguRb
	 XCGy062rzJ293D/xdw7MifYH2X4KHrJ0+EWceRiqwlHm6dtqc6OwV1Ps0igx+i23eZ5C/
	 0lyuMRYJyfrsWRyV4emdb7OnjHvDTg5Al+qM07y36bMOvKZMkKD4woaCeuVhxSHYinBYs
	 sUKQatpRC40naydKWGE2FtTrrBO7saofvz+WLTsHi6hkdKYC5qJe9dPGIXutX2FkymhL/
	 GY0GoCme8fuDjaGxWOlyN6/Mx7f/gMKzMx6zELS+w7TellsNo3CAeDufiOsDyBPQ3bw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 079711F000C7;
	Sun, 15 Nov 2026 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781807;
	bh=1gLNBYp+ck7xYQnvYM+G+PAF9GWuVTdzo0tmuZTHUOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iFQBAC4MYpU90/lDAYWGaic2mbW+YCwsliq/idAoNS89ZL5orJIikuLcFyrr2ixSz
	 NBhJhbjGBDI0CFe3hJBLnQcFxEHKqtdoWSFyCelJfoi3VNQLUnXBBU/GAEAzbM1Bgn
	 3zTXtplU/yjcFmvNYzdwJwOeI90pvQrL3Egady7vOTvC6hk8+3PqPjT0x2CCwdRzs1
	 3AuSQzDJQBAzx2Cf49k+CtuvKvzvfa2THng8svpmjZ8DI/4MZFRA2Lf3Otc43eBjD8
	 1xpO3NgdH4v+QFGJZF2rMQxKc6o21ELcvZzZYqdyp9PICa272hStkXkfZmNDNTqQ72
	 fs44LUe42qdlg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8819F4A228;
	Sun, 15 Nov 2026 22:30:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Sun, 15 Nov 2026 23:29:38 +0100
Subject: [PATCH 3/7] arm64: dts: amlogic: axg: Add ranges to periphs
 pinctrl node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261115-fix-amlogic-dt-warnings-v1-3-94cbd67a32ea@aliel.fr>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=t3oox1TjzpL1ctm6S+5Ku7TzDmvGbGuVy9dMZYSp6B4=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9Yvo9RuaxaGU1OPHnxSk9zGLPtc4/4xXUeuEBPNCeGOe
 2xMby/vKGVhEONikBVTZOmfa3ni3eWjZ77uUU+BmcPKBDKEgYtTACZy9zXDP5PlYj9CXxlM9ctY
 n3T17frIsFN3ms5vMHvW3TubgbNSuIDhf/qOHJ6Szru3N04UcvbYrNreemFpS3e+8QyXnnN/tx+
 bxAYA
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

  meson-axg.dtsi:360.33-1262.6: Warning (unit_address_vs_reg):
  /soc/bus@ff634000/pinctrl@480: node has a unit name, but no reg
  or ranges property
  meson-axg.dtsi:1609.30-1716.6: Warning (unit_address_vs_reg):
  /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg
  or ranges property
  meson-axg.dtsi:360.33-1262.6: Warning (simple_bus_reg):
  /soc/bus@ff634000/pinctrl@480: missing or empty reg/ranges property
  meson-axg.dtsi:1609.30-1716.6: Warning (simple_bus_reg):
  /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5b8ef98f6d03..dc932629c92c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -361,7 +361,8 @@ pinctrl_periphs: pinctrl@480 {
 				compatible = "amlogic,meson-axg-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x480 0x0 0x480 0x0 0xb4>,
+					 <0x0 0x430 0x0 0x430 0x0 0x3c>;
 
 				gpio: bank@480 {
 					reg = <0x0 0x00480 0x0 0x40>,
@@ -1610,7 +1611,7 @@ pinctrl_aobus: pinctrl@14 {
 				compatible = "amlogic,meson-axg-aobus-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x14 0x0 0x14 0x0 0x1c>;
 
 				gpio_ao: bank@14 {
 					reg = <0x0 0x00014 0x0 0x8>,

-- 
2.43.0



