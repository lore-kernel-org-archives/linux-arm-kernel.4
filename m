Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA79606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WHLBV+WT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FJ16bXZFcdXtHsxZY9v7xo6tcK8QhcjGNUaSnANHJx0=; b=WHLBV+WTJw6tHMg2mcXFXhZh6S
	SaMGRaJKVMsvJjgamIEsRo2VS3DsOXQ+M1JI/GPLoLfoA4Yg38t1WMXw7p8JtvziHm0q+W1wdA1+w
	26LVGsCmfHaxFd2SgApjsPSCq0vzQb6hqUn3WBCfldTw7JA7LIKKAaNKpNZwSHyL56+6wjO5fi+vT
	/stCZp671dRGfVTgATEA9+U3ME2lCLVofx5+m3XfVWXNPJoNxXO7azBjM33ECequx2eNrkTTDevWT
	egWHtZTYcprSmbiYLWW+ErPsKyojBq3MyULdGCy0hfEctcQiX4eNrjD4aRD8j2xUUl5qnPL0L9WPv
	VysfkzJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVztW-000000084TI-25uB;
	Tue, 24 Nov 2026 23:25:50 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVztT-000000084SR-2Zeb;
	Tue, 24 Nov 2026 23:25:49 +0000
Received: from 8.2.7.0.b.1.5.7.a.9.4.1.f.a.c.8.c.6.e.0.c.6.2.0.0.b.8.0.1.0.0.2.ip6.arpa (unknown [IPv6:2001:8b0:26c:e6c:8caf:149a:751b:728])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: chewi)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CA44E34245A;
	Tue, 24 Nov 2026 23:25:43 +0000 (UTC)
Message-ID: <3d7bac3c74eec1015e17954e461fc5c4c41e6a72.camel@gentoo.org>
Subject: Re: [PATCH] PCI: dw-rockchip: Clear stale link down interrupt
 before unmasking it
From: James Le Cuirot <chewi@gentoo.org>
To: Niklas Cassel <cassel@kernel.org>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>,  Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	
 <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring	 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko
 Stuebner	 <heiko@sntech.de>, Wilfred Mallawa <wilfred.mallawa@wdc.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Shawn Lin
	 <shawn.lin@rock-chips.com>, stable@vger.kernel.org, Manivannan Sadhasivam
	 <manivannan.sadhasivam@oss.qualcomm.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 23:25:38 +0000
In-Reply-To: <20261123121217.1107902-2-cassel@kernel.org>
References: <20261123121217.1107902-2-cassel@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qi+2NtxgvrcQ9iOuxkU9"
User-Agent: Evolution 3.60.2 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_152547_677435_CFEBD656 
X-CRM114-Status: GOOD (  12.92  )
X-Spam-Score: -4.2 (----)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--=-qi+2NtxgvrcQ9iOuxkU9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-11-23 at 13:12 +0100, Niklas Cassel wrote:
> PCIE_LINK_REQ_RST_NOT_INT is set by smlh_req_rst_not, which according to
> the RK3568 TRM "is asserted after power-on reset until first link up".
> The bit is thus already pending when the driver unmasks the interrupt
> after resetting the controller, both in probe and in .reset_root_port(),
> so the interrupt fires as soon as it is unmasked, even though the link
> is up. Since each recovery resets the controller again, this results in
> an endless loop, as seen on a Quartz64 Model B (RK3566):
>=20
> =C2=A0 pcieport 0000:00:00.0: Recovering Root Port due to Link Down
> =C2=A0 pcieport 0000:00:00.0: Root Port has been reset
> =C2=A0 pcieport 0000:00:00.0: AER: device recovery successful
> =C2=A0 pcieport 0000:00:00.0: Recovering Root Port due to Link Down
>=20
> Clear the bit before unmasking the interrupt, and in .reset_root_port()
> only unmask it once the link is back up, like in probe. Also keep the
> interrupt masked while .reset_root_port() resets the controller, so the
> link down caused by the reset itself is not reported.
>=20
> Fixes: b376b3ff9cb0 ("PCI: dw-rockchip: Implement .reset_root_port() and =
use for link down")
> Reported-by: James Le Cuirot <chewi@gentoo.org>
> Closes: https://lore.kernel.org/linux-pci/08cc96c5171fc969b074371692e6d95=
d46eba60b.camel@gentoo.org/
> Cc: stable@vger.kernel.org
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

I can confirm that this fixes the issue I reported. Thank you. :)

Tested-by: James Le Cuirot <chewi@gentoo.org>

--=-qi+2NtxgvrcQ9iOuxkU9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEDBAAWCgCrFiEE6qETVs4yu3Lfuc3XsNCJZ6jP87QFAmsGHPIbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25z
Lm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFQUExMTM1NkNFMzJCQjcyREZCOUNE
RDdCMEQwODk2N0E4Q0ZGM0I0ERxjaGV3aUBnZW50b28ub3JnAAoJELDQiWeoz/O0
yP8BAPdopBp92UiyxdZ+jUx1aLnzOP2TATZVOBOtL27OYcZ1AP9p8sIx9Hk+iRsu
qeK2k/0h9IIIwLieulOsh/hlJkdDAw==
=jlB3
-----END PGP SIGNATURE-----

--=-qi+2NtxgvrcQ9iOuxkU9--

