Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DB8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fx7X20cn;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=kvd2dt1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DxJ/XoENpsoa0BG0OwfPHHeMkEO45OcTsZupEqdYCwM=; b=Fx7X20cnTcIk617qRu2eT9Owap
	QTuvKRaySOJBr85tAKfruO4XVXoI+bl53XHxqFE2i3/2vPdalH901s9PJN1OGcMwB6ZlAgOQoJJ2n
	Kf6Fo0z4ujrcJq6IyFAG/uSZUX+o7TUzGV0yp8NpJC/frkIZV3v0U1geE6faPxpAxEZxEw39ijuKM
	QYdPGslr6UDle0n30IoaKpgXM32ibAc3UxT+Q+Xe+co5KuU2gZfnNeufAggM2wwR1Qq+fGIR+1d4b
	sroMKDenbu5bn5JuF9eZjHGEf1MRgD6f4s+a1+4eQZJM4nqLzCMhm1k2Y3+oWDjj2qNmWGn4wGNhf
	+FPiNEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDcm-00000001g2E-2WAj;
	Sun, 22 Nov 2026 19:53:20 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDcd-00000001g1Y-2vhO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:53:18 +0000
DKIM2-Signature: i=1; m=1; t=1795377188;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
 d=web.de;
 s=s29768273:rsa-sha256:McviSmFTfiRStRe172zuGVWTtnIw
   OATGjw3HMUJC46lZFN/yttmz6iQxSTf2jc/FBO4wOjrUTbeDl7PxlHiFn3i6t20zRkYjH0sUqub
   AeVk8MbxpUgM6LmzATSMsIy8xrZ5TAxeNkJDb+ETGiEZK3NJXAd3E+FOJbKssXcwH/Gt5sjoAXQ
   5JE0vO5b59d155AnZo439HYVRjOPNmhsvPPr3OZXC8dqRSBItIs55UB/kSVs4LIBP7dZw8zJonA
   3bDnVXlqNJK6J/joEqiW/LIaqBcTsdXhPZPi3XcUYUc8bXQ3Y189bk/9XVJvLhmKaITJMJHE3WJ
   My3Oo/vOW1RSNw==;
Message-Instance: m=1;
 h=sha256:
   D5rVt4ryQI01eaKGx4kHzJgI+HggMqtO760LFwVMQCA=:
   +h0OQCegU2Uki9JfrK9GeQlM+mKOlw8oWpls3LIaLVM=,
  sha512:
   SM4bG8frD1m0dE0Anwbz0l1nmrQNS6QlrGi3yalY8kGwisZpEEZRj0BgeyGFMgHieJWDJcDYLQSTc1Pa0u5LZg==:
   92CXVhttNj9bHRgYx789yN+d/DTFuGpnP2qIxb3jN7iY0GjVbe9meaKXNDbrYPQQYGlcGp8nckKOC8eKUh6CPQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795377135; x=1795981935; i=markus.elfring@web.de;
	bh=DxJ/XoENpsoa0BG0OwfPHHeMkEO45OcTsZupEqdYCwM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kvd2dt1o8YFP/2gAYgDEL4YlKDF+RHjm+CV5QRn6lw1uQQQ8UdFCVmpBDUNrpnze
	 Bv6ch1J5PvBFnsq80MW95fAlLofrlSMzBnQEKOnhj/ogpcuRcihNgOM+s8x2trd7z
	 AkPNZtUDBFSRgXL0D+WZpMzsCLiyoWIAr2bgikyfyhRC67aYmIjt8N8fpAdl9G7KG
	 TtDVZE5pSV3m08i59FU/b5qlFOK8kfg/lEvh305rZmMpxtxx6h411usDvFeToQb8K
	 bnlzgpVrSW8sVW7aj2Mf6KrhA11tqi0/7MqmlGwCJZ26e///0bYmYjsZfv+a7O+SK
	 NeVUbVpHmTjlP6eeqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJnrX-1xogGU14cD-00KsoG; Sun, 22
 Nov 2026 20:52:15 +0100
Message-ID: <f691bbaa-ddb5-45bf-8f85-fcf354a6af03@web.de>
Date: Sun, 22 Nov 2026 20:52:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Michal Simek
 <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <sean.anderson@linux.dev>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] PCI: xilinx-nwl: Use devm_clk_get_enabled() in
 nwl_pcie_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:so1GHCFBbuTUuC6TUJEMAci0TR+yKBhHP6oWeOsI2tWY0AG5PaU
 lPMJcaa7TxQvkzdVk/darvg+U6RS/y6ExjWVmVzLsr+VUiMm36xD0AeAvZmUIv5BwlAVTr3
 7m8lwEBUx+V8E6EazR7npXTjFEMCYXbhtDPWeT5sDvpciL1mg79qAFLaLazuOUm3KtCuMdb
 4eyaHQdAZpCdqD9SbhvTQ==
UI-OutboundReport: notjunk:1;M01:P0:POx5QCjNJB0=;8HGCU+pn6/uS4d9e+2ECQT5uil7 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 Xf/X7CKrR2zwf6ULhdQc0zlsIgqMmilU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_115312_238081_E86A0DF8 
X-CRM114-Status: UNSURE (   9.89  )
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Nov 2026 20:35:35 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Omit a clk_disable_unprepare() call on an error handling path
  and in the implementation of the function =E2=80=9Cnwl_pcie_remove=E2=80=
=9D.

* Delete the label =E2=80=9Cerr_clk=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/pci/controller/pcie-xilinx-nwl.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/contro=
ller/pcie-xilinx-nwl.c
index 0dee19fa24ca..fd134317e9c4 100644
=2D-- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -844,20 +844,14 @@ static int nwl_pcie_probe(struct platform_device *pd=
ev)
 		return err;
 	}
=20
-	pcie->clk =3D devm_clk_get(dev, NULL);
+	pcie->clk =3D devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(pcie->clk))
 		return PTR_ERR(pcie->clk);
=20
-	err =3D clk_prepare_enable(pcie->clk);
-	if (err) {
-		dev_err(dev, "can't enable PCIe ref clock\n");
-		return err;
-	}
-
 	err =3D nwl_pcie_phy_enable(pcie);
 	if (err) {
 		dev_err(dev, "could not enable PHYs\n");
-		goto err_clk;
+		return err;
 	}
=20
 	err =3D nwl_pcie_bridge_init(pcie);
@@ -889,8 +883,6 @@ static int nwl_pcie_probe(struct platform_device *pdev=
)
=20
 err_phy:
 	nwl_pcie_phy_disable(pcie);
-err_clk:
-	clk_disable_unprepare(pcie->clk);
 	return err;
 }
=20
@@ -899,7 +891,6 @@ static void nwl_pcie_remove(struct platform_device *pd=
ev)
 	struct nwl_pcie *pcie =3D platform_get_drvdata(pdev);
=20
 	nwl_pcie_phy_disable(pcie);
-	clk_disable_unprepare(pcie->clk);
 }
=20
 static struct platform_driver nwl_pcie_driver =3D {
=2D-=20
2.56.1


