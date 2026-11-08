Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C8606EEB2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mXbvYWzc;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=b8RVwu1v;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3IwuG92D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lDzVcp1bTgJqeWMJHHLt9xWG+oSgGYewvfT7h6V9gqk=; b=mXbvYWzcPPY/CRmD6BOYX0w2kd
	6EmQ8b708ZGgTnHQ5ghG4V4PLgYmwWaaBb8hMFdt/bULlYR+4LWMvoSS+5U8DhTT9kQNwzlSGFeTD
	YXBOlI2OC/MTvazE6LtfifN5xgZv9Mswc4kvSJydoIeoB5zATrRj6BknJlJMhSbQwYfWWqHPPJVHB
	zYVQZMD7fyQxE8EN9/3cjXuq8t/kvlRPUqYkteJwsB/8NaFrUG4jhZsB5HgaYbC29oaIDmhczcVwd
	+Eoy70NCRR8so3DZ/42PTu4ukflOy6Wc7Jc6KBIstWsYYTnQJC5j3wtKD2uACQvvXzBCnSBo20A6b
	P67Hhlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nO-0000000GFFu-2e1c;
	Sun, 08 Nov 2026 14:22:58 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nK-0000000GFET-0K0z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:22:57 +0000
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 65293EC01F5
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 09:22:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 08 Nov 2026 09:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1794147770; x=1794234170; bh=lD
	zVcp1bTgJqeWMJHHLt9xWG+oSgGYewvfT7h6V9gqk=; b=b8RVwu1vXK0QBfk0pR
	+n1rq6wsI7x7yPEayVsgTKpoV0HuETQ7M+Wjb5HlRGdAqfeKno1BytXwW12nq3y5
	DaFE6Yf9IssjZYHbf+TnAssW5/f3QcXlftmqzkLqs6o5YXPfUc7jpFr35VBH1q9z
	dlHz5Zl4ODbwEkCXOt/xdbjlZlTkyycR36yU64hat+UXTVmxw0Asza9XespUwNdX
	ffko4J1UvgdAYdVwPoabcFTeJaI8sTU+HttZoXMMHGsXjFm5Zbz0+dsbKcWk7pni
	hJpfdQl+zpOm71kTybvNfO7izUm5y9zxdGFGJUpkGaC8DklhTppfMNaZVulrzHDS
	I5aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1794147770; x=1794234170; bh=lDzVcp1bTgJqeWMJHHLt9xWG+oSg
	GYewvfT7h6V9gqk=; b=3IwuG92DuIplhpgvDwSmntV2pwMpoCzdNDeDWrXD9IfL
	GVQVmEsEN+UX7BExavvJe72ii5j/q+jbs/4EaqkgLy7LAuieQYL7VBo0HeNvcypP
	3lCopLJmClZyepr/ORvIbXqBE4SWURK0xGx0zFqlkm7XO8nvJxsROiaXmnrZMRde
	iSGsJ7Ro1CsXG77kHfwcdOGviWQA1w3Ag2mOp2ei5Lurj9uYJfZ9KfKqQzjxaGAH
	Cp2MzQPsnvGPAEwp5oyBBrmKOsxtDQjMbmlwAU7K+YM+ilgWkJs1yladNKjKk/Aa
	vfsCJ5zyMi+uCIVIRbuOLLwpEbY2sOQ/XdR8MAs6QA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794147770; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:a6TyZIXfbXIK9mRw3hHp194PL8Ia1drngegy81mxPvwJgWi
	V5ymfYOFOnqx8TMp66K+//gnpccExSL0Qek24dgqNgjhYygqNHA6ErJgQC1d4vlP
	dmm5DTygbfiHOXYPEWF/Gv18Wek7QBVjwjQ3QmPAAlcWLNgb6qqCN9sK5ByhYPeJ
	b2pbtKz+qsny0Z2PWM6y+u/fv15nN2CBkJ4U76Dj14BvnZ87gtKWF41ieAB2kbQn
	JOxmvnvVoull3MuuggxXHSDnlq3EGGvgIaL2J2S68FWGP9f3faUv6Tu8koL8tRNv
	+ARqnaGcm/ci4PWi/agxsKwN8FVQJGKw1CvgKZA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:1NsXmGMa0eRM9nJfuJllF4HmbWds1tNITnd/go8q+lg=:1FSI7VpvI9HBAJVh0slm9bQWgX2OZnVpTVVJnzGdiI4=;
X-ME-Sender: <xms:uYXwasT14ATms39quBxYU1WCqxTlQ4vt1-WdRPk7n2atbdeQB4Y64w>
    <xme:uYXwaoKmuQwOyP5BetltZ01_jWwrLohjwyYmgUEk8AwFOd16mpjgG_9V8GINffeFl
    235LFJylvBIL9gR5CsQ3TcqThfW0dbqeSJc4uk48VGXTz2EX2coTls75w>
X-ME-Received: <xmr:uYXwal1q6O3Lkj5jJ2q5zWGM4Dy5wbM93Lem8vbUWWd-Y5PBJf-RNvVAZ7gKEyvrgqEtDOE83v1ax1IVOOiHtsQZhorUhwyaxn8>
X-ME-Proxy-Cause: dmFkZTGVCEBAWNMuvpK4V017RQEy3JhGATTzG9560omovpYbMERWekm4tSfbH36O9c5CLA
    hlj4+Qh9d7zUKlcLlScb2uKVP+8nPNz+q3+eRgDfvfGuQqeAc6PuIQSCphJKYt818Y5/5O
    dCf68+QuC+S5wGxW/N+0qDcQi2fKYs5+rnAK3oxCobmCYfEh4Iq4sXcmBhgI0qvpmd2iZq
    3kk66y5Aw+XbqgARuRrcMwrc+XawzMSNmc15eIqnIa1iHtB4GlObjVV8DXocDGIDILClvn
    rMZMZO3miwdfJJCMMCsRkDc2g6cIv9vJ8VRSoBWSuEwCGiczcna3dI+n55rI4cBEv2IkOs
    eoEQDCYlQ6KIOkyo9brIX8C8nc+bnoLxNAFSj228VlTNmj4c4fiBElSs9DDXPrQtRy0CXd
    dOT8NAH8Nkhs1MvJO9yG57hUrJ0OECLZpW/Tr6I80RTKAEpgghpWO5V4thLX18+AeWSpKN
    shmbPp46ZHH49uPJvpetiSJdcSyXZEU+lSWWpM62YUaiqHm1EPY53X2TkhDBMa0l4lOJGi
    M6zWkbFznuN2utKcjFxgG6IjDpKfnJclDa1Mf6fS6qvV28GuY7PWbuSL66iI3anbJdCknO
    eDOjAf1hBiDhwDb1HrruHovzxRgppmSsdhLS4DpUBGeSLk4x2qFch3eURScA
X-ME-Proxy: <xmx:uYXwajJunI_g-4ZmnWA8ZJAjIQqh0jSefe8LCczdCwmyhnpKIhRF9Q>
    <xmx:uYXwatn4fayorFh4hXlZDfN40zOIOIxxzYo-scXIM3EPcTOEjsnxHQ>
    <xmx:uYXwapOeUP9pkQF_SJSyslkYEg-xO4u8BZD7H4tFrL6NUlvFn1CiUQ>
    <xmx:uYXwakykCUyCURyftSP-VI5hahvKhEoIzyuClhzTJcoVQbfvyGgs3w>
    <xmx:uoXwamCCWno5wVjIbz6sgCBxyNaQMQt9LrPaUiwPVBny-NAeba1m95cu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:22:48 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/7] Apple M3, M3 Pro/Max/Ultra PCIe device trees
Date: Sun, 08 Nov 2026 15:22:34 +0100
Message-Id: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12NQQ6CMBBFr0Jm7Zi2IhBX3MOwGOogQ7Q0LRAN4
 e4Cxo3Ll7z//gyRg3CESzJD4Emi9G4Fc0jAtuTujHJbGYwymdYqRfL+wfg8obfCSJybukizmqi
 BdeMDN/Lae9fqy3GsO7bDFtmMVuLQh/d+OOnN+7XPf+1Jo0JWinJDmUqbouzIORqPjgeolmX5A
 AWZfv69AAAA
X-Change-ID: 20261104-apple-m3-pcie-ae72b846baaf
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>, 
 Yureka Lilian <yureka@cyberchaos.dev>, Alyssa Milburn <amilburn@zall.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4167; i=j@jannau.net;
 h=from:subject:message-id; bh=1FSI7VpvI9HBAJVh0slm9bQWgX2OZnVpTVVJnzGdiI4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPrVu2fjqtLSAdVC3y2mb+qtUcnt1vzPe6rzzBtv35u
 ndSLwq3dUxkYRDjYrAUU2RJ0n7ZwbC6RjGm9kEYzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdIs/I0DndUYFXoTfY7tTW6S3fKx/3Wj7g/fFXx4fvTZ7ksiWn1jP8D3ux6c8
 esRkTlKviFfcciMhitv03MbGBVepGbvb5umVfGAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_062254_489857_2365B766 
X-CRM114-Status: GOOD (  13.91  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hej,

this series contains the device tree changes for PCIe support on all 
M3, M3 Pro, M3 Max and M3 Ultra devices.
The PCIe controller on these SoCs is compatible to the M2 Pro/Max one.
So add the new per SoC compatibles to the dt-bindings and add PCIe
device nodes for all M3, M3 Pro, M3 Max and M3 Ultra devices.
The series contains a fix for the M3 (t8122) power-state devices tree
nodes. A power-state required for the PCIe controller and the NVMe was
not correctly represented. MacOS keeps this power-state always on and so
does the device tree for M2 Pro/Max. Do the same on M3.

Based on apple-soc/dt-7.5 [1] to avoid trivial conflicts with the NVMe
series and to import the M3 DART dt-bindings from [2].

The series passes make dtbs_check and make dt_binding_check and does
not introduce additional dt-style-check --mode strict warnings with
dt-style-check from next-20261103

ciao,

Janne

Link: https://github.com/AsahiLinux/linux/tree/apple-soc/dt-7.5 [1]
Link: https://patch.msgid.link/20260925-apple-mtp-keyboard-final-v4-0-304c267518f4@gmail.com [2]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- capitalized PCI and reordered words in dt-binding's subject line
- adjusted WiFi/Bluetooth PCI compatibles to BCM4388 for M3
  Pro/Max/Ultra devices
- Link to v1: https://patch.msgid.link/20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net

To: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>
To: Neal Gompa <neal@gompa.dev>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Joshua Peisach <jpeisach@ubuntu.com>
To: Michael Reeves <michael.reeves077@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Krzysztof Wilczyński <kwilczynski@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: Mark Kettenis <kettenis@openbsd.org>
Cc: asahi@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org

---
Alyssa Milburn (1):
      arm64: dts: apple: t8122: Add PCIe device nodes

Janne Grunau (4):
      arm64: dts: apple: t8122: Keep ps_apcie_phy_sw always-on
      dt-bindings: PCI: apple,pcie: Add M3 generation compatibles
      arm64: dts: apple: t6030: Add PCIe nodes
      arm64: dts: apple: t6032-j575d: Add PCIe device nodes

Yureka Lilian (2):
      arm64: dts: apple: t6031: Add PCIe nodes
      arm64: dts: apple: t603x-j514-j516: Add PCIe device nodes

 .../devicetree/bindings/pci/apple,pcie.yaml        |   6 +
 arch/arm64/boot/dts/apple/t6030-j514s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030-j516s.dts          |   8 +
 arch/arm64/boot/dts/apple/t6030.dtsi               | 165 +++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          | 157 ++++++++++++++++++
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   9 ++
 arch/arm64/boot/dts/apple/t6031-j514c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031-j516c.dts          |   8 +
 arch/arm64/boot/dts/apple/t6031.dtsi               |   1 +
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |  72 +++++++++
 arch/arm64/boot/dts/apple/t6034-j514m.dts          |   8 +
 arch/arm64/boot/dts/apple/t6034-j516m.dts          |   8 +
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |  41 +++++
 arch/arm64/boot/dts/apple/t8122-j433.dts           |  28 ++++
 arch/arm64/boot/dts/apple/t8122-j434.dts           |  38 +++++
 arch/arm64/boot/dts/apple/t8122-j504.dts           |  26 +++
 arch/arm64/boot/dts/apple/t8122-j613.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-j615.dts           |   8 +
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |  29 +++-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          |   2 +-
 arch/arm64/boot/dts/apple/t8122.dtsi               | 175 +++++++++++++++++++++
 21 files changed, 811 insertions(+), 2 deletions(-)
---
base-commit: 6c799b8c0df41869fa0d059f7e54f8f84b3989ee
change-id: 20261104-apple-m3-pcie-ae72b846baaf

Best regards,
--  
Janne Grunau <j@jannau.net>


