Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888D606D801
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inNdbS7l;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=g77xhHKi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=S1JiRCX5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=inNdbS7ly6kPAH
	5Rr+odlOQKtf51a37bW5u5RvR0HVCw36j5iEcpJkja4P21kF4AKvo9DAjGw9EI4N6kJF/NjCc+lsU
	f/sFYHSRohp/kYfkZAiZYVXjBi+zAqQizaZ1C44ncWaIxbP5f9zAS41V6VkyHp2OSX0SZSY+pCdBh
	fQbRW6vzm+RSnLGZ5Eu4sDExZm2Gv4oafmlbJDCGYAstpoSDB3Ussl6a18hMRqE4O9bOJOLC2Dgj0
	wCiy1YDTpKNS13BMAbjHOOSeIX1NGdc21817xdU5BLXGW0m9q8y8qYSAcSMdDoVRZTP8L901fSzOs
	PHpg5dkJlUELwA92RCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nO-0000000GFFg-2EGt;
	Sun, 08 Nov 2026 14:22:58 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ3nL-0000000GFEU-3YTb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 14:22:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B89A41400124
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Nov 2026 09:22:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 09:22:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794147772;
	 x=1794234172; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=
	g77xhHKiwGUpPp1bAq1Bt83pcZ/Jis0P5OCRhrdwiIgXa5PX7UgyxVFlvy2p7oG3
	TNA6XxQlX809+unZUcLVQucJJXM2v6CPA5LX4rEvE4fA6kaar7XCUlSa+G4DNsJK
	g7lGoPqJbf6Fgk+kCwSKkN+Ye1R+c9agfzxRuG9bkuws2OVmuyMuycg0QvrDAWuQ
	pICkgYMdeBBV1BdsGurhMBS6LLsBIcwd3eUlH+IWC7nU+XkQP2sVRM8GyECJabpl
	C7gs6gYT3SxtYYILNXLnF0YdjxHC7450QJZMqQAn8KisHAaX2SyDJcso/IBhPrxL
	awczdOyRop8uWNOV+X7zag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794147772; x=
	1794234172; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=S
	1JiRCX5tY492f+3KvqZTvRcUjN0u8uSL9qTEO/eYdxQUDhVacHwACGFDRg1q9WpD
	CtpuBYDNN8dDl+07cN4seVcojM/t2Me1DtHnPGdAuCKWacNyr7NspoapzNblZMuq
	c61i2280C/pLQp2h+kDHFAIvqxa79DSywxKzrrd5Oi8rWlulz4mjhycg9Xw+5s2c
	XkC2cjEdDvzO3BWrYBWLK6awX4nI0fE7pWjMjkbIGl/droSkWBpGmImlE75vcT8y
	HyE4fOM+H9X/qrz+/c4SkxN49L3O0tRBs1SMcXKYu6T9f9VQinxhK4/P1y/zXynO
	yx1EGq52g6dlB4n/GDMFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794147772; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:I7aNuj4zyX+LG3okXlzlpcyV3npE6ZP3k1E56GOZymUro+9
	moOqEb0bjCF4XNRLT5n0U2PeFnhMC86XuEfNCMzFSpNe+3g72pp/xkdU+iu2Zufs
	8cu1LGkW+9ZWaTzw3w4g2zCJ1oo4CzecFNliTK678StrgYazAE2v+WQmNEfSJDnc
	tCrCsMFqbUnuzTXagorJzwDuTu5VfLcrADWSu7WykJAwgDKiK1gDqbsq4bRuo7hq
	vCAlJtTAttRjiIoxkj++ZKPIZpYGzvYdFrs/FosMo35Xnql8b6Gr9AZFLWuzsOmw
	CVwBxsTCAvSVsj3WjGQgPOUZ78eRYJSwmCXgzig==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ONM+wdC2mc2GHio0FXqthaw8hL3ScbvB1IVRgFrqR4U=:4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
X-ME-Sender: <xms:vIXwan_1KhIzNOuJKcz2qUmMWo0Iotl_maUZ0B8WJnjkCMe9btZCiQ>
    <xme:vIXwalE4CSo6V4bHtD897kjqIyJxNMMQTh8sq4BQoCX6YKIjFPRM2Fwlf9qyUcwKJ
    fVPDgIYEO9G8LkYqTqEN2oCXI_jKIYZSItw9RUtOOPxfZNTNpWKuQxv>
X-ME-Received: <xmr:vIXwauR_6PKSOhYnD6mgXm4dpNbVmxSlaYufiVqO_8fdRZ3exY8XNfOSo-pFE2LWIcD7BB5tbCEayk_sJFqnVFrRHTDUdH2VU58>
X-ME-Proxy-Cause: dmFkZTGAYn/JwI0NEHfb7CIV0+JF4g1gQSai3gkcHhm/2QbriRgW/y5c2skXuQufRnEs4B
    Zliq3AjZY4mmGjBkelBsYyJVBEkqVwHh5ON65q1orasDnTAQVYfc8yCFL3HjBq9Cjw2vet
    DuKRRPH+34k7V7hOnH2lkf+HFY6hXu/s4B2JQov+1sPyV3JDoiBigbmQ9m9rCMyZgrJc1j
    0952wIsVkerVEgKSSz0oxOnpfKFk+0tXBqCoLojENDwRF143YOTStk4ujykJBNzByTM+1x
    d/u6jgutlWOuyk5bFqmopUjAfGRljp7tv8RdgJJOkBWLlx8FcpR+ErFd+ogIPl7x8SPTgY
    idH6qRdNkfNKC6KWuFjtq7Lp6kBuBAsUw45kl/jSWoW6yOms1wkRzHH6UIL1I3ZT5CEeAS
    YSJnGrP+B1cgHkEUZADi4kX20wHML59eTSElfkNfmQykZivFT3WI6UInUROn2vHrDRtpac
    m0YiSy4PRDvHzZBC2DmOE2DN3jhu1ESNNdTOU5+Qbo7XOzTHb4IGBk2m1tpkBYy2Csm8kZ
    J8V0X95zOKwa2UxFdKN7MT2cBt6KtHgLgTpuejk8L/3kFpstvF+U+F+absRFADeA2b5JSk
    fuYduKCHjU8lI08OvR6g1UfNjpmizzYkswBd3yZELuL6hdPDh8ruL2x2U5QA
X-ME-Proxy: <xmx:vIXwarsCDPK1J6OGyi3DiYf_d_Mioe0_-DBSdgHeIZAvOitlr51HGA>
    <xmx:vIXwajA1m52ioj7VLugpb-TzlM652I1iQ1ZQB6fEfG4N_-CBbFEDvA>
    <xmx:vIXwagcjAkpMGyaUAND5swdA65Nj_gM_5aSE4o1o6CfqKSK6EERl5w>
    <xmx:vIXwajqGxHwxvW-NFWe0Qv62tSnfuv7jfgoJ3Idw5_wY7UrZu4UllQ>
    <xmx:vIXwah84xXQv-VFC14xVYKNgzP0GpHu6Akwg5yoYBv2pj9ok6u5ACY1n>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 09:22:51 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 08 Nov 2026 15:22:35 +0100
Subject: [PATCH v2 1/7] arm64: dts: apple: t8122: Keep ps_apcie_phy_sw
 always-on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-apple-m3-pcie-v2-1-0e5ffec71da4@jannau.net>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
In-Reply-To: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
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
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=j@jannau.net;
 h=from:subject:message-id; bh=4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqwPrVumWWs/zn+Tfz0yLkUh4cLu5dwRdy+Fu800f3ZZz
 THzWIBux0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUszxgZtghvkHDIOvROQOL1veqUc4e3NvgW7VzVbSm16pGm+OXzLxgZdjxbV/b
 PVkL5n4b6Ed6IW7NMRGwmCNfyTTb6V7XcIMacBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_062255_962873_4DCCFDCF 
X-CRM114-Status: GOOD (  10.37  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The APCIE_PHY_SW power state is in Apple's device tree a child of the
virtual storage and general purpose PCIe power-states. MacOS however
keeps it always powered on. Mirror this behaviour like the M2 Pro/Max
device trees already do in t602x-pgmr.dtsi.

Fixes: c65ab4905e58 ("arm64: dts: apple: Initial t8122 (M3) device trees")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 3f8be74b5ea8..3206787dd208 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -899,7 +899,7 @@ ps_apcie_phy_sw: power-controller@4a0 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "apcie_phy_sw";
-		power-domains = <&ps_apcie_st>, <&ps_apcie_gp>;
+		apple,always-on; /* macOS does not turn this off */
 	};
 
 	ps_atc0_cio_pcie: power-controller@4a8 {

-- 
2.56.0


