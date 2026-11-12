Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CE4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 03:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B3QkE7pq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Pyois4i7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=od2MTFJr2n07GulawypdnHc+XDeU/CQF54c7+qeGSkg=; b=B3QkE7pqpzW6dcTrdPsvA9Xx7I
	Ig9Itd3cRlvkSz97PyXgDVYt555QHYB6lkesdUQefFpVfJLnawi05Nk5n4ItoPwGgvNyUmEeW7tZk
	wFl9l7eG9XC7/ywHDisUGHqAcgDETFf2bs7MzZOJB1yfS1d51EA2cL10OrXzly305lV3JFLKQc5fQ
	zU+/ZTmcTTUVa459BDz+53mX2ekTNEbUIXkUNjXY/pHHKV0dEtw1FtFsiFdJn6/0E5+w4KYkW8Ss3
	hQJasPOpe23QQyl2y5HiywxkTMKEDIrNLujdJwWCjkqZbpQTvSHRzl9QGlrgUTmj2In9zgU4btLvs
	fvDwunpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLqD-00000008eVm-16hB;
	Thu, 12 Nov 2026 03:51:13 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRLqA-00000008eVK-3Hce;
	Thu, 12 Nov 2026 03:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794455460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=miLEUgmPqEBpcIUKRBbHJcTMV73hdJYQRlNyUHE0BMSpiI6fmHAvyb8adXuq5UAVbQ5AowDfkohUjSyVu+k9TIoCaCCOZe1uLoN5joY5e+7CbIxAzfia9iiro8XAF6cqusXOVcSrvTqq1m2g8N17KFFLZT5Wz6HoyGFUnqhIrU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794455460; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=od2MTFJr2n07GulawypdnHc+XDeU/CQF54c7+qeGSkg=; 
	b=YcBfySgNNac/Gr2W4Mj6FBzx3G6IXTcAbeQ0ey3pTxW0C+MjtgJlD504YjKtwwJ3WnKu8aUXWIvxgqSth5Ey4Ez9fr1BITAPSqG2aPvNL3PdwrvsBBZKQxsbnSFNLzSlNjXpBZWHm7torfuRhaGA7MuoDfFKTbqkGblF/uGopVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Pyois4i7O2HfzlPfTxnQqjrvraZ4PYa2L7WfF+E+HQyBKTQl1iq2FfSYXWJNNSv/XN0XEVfp0220gEvkOq8QdQrVA+7X7K6mJMUNvwZCRfqOCFy0/RRFwnoEXHvyO080ZDeXpVD175i3pUubojIrbLnxpghFq8X4nPmn7OFsZDE=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=od2MTFJr2n07GulawypdnHc+XDeU/CQF54c7+qeGSkg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794455458780967.2624418168582;
	Wed, 11 Nov 2026 19:50:58 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 9CDA2180BC0; Thu, 12 Nov 2026 04:50:53 +0100 (CET)
Date: Thu, 12 Nov 2026 04:50:53 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: aiyengar1990@gmail.com, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, "finley.xiao" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
Message-ID: <avU2I_QzCiBPVTDC@venus>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <10924894.NyiUUSuA9g@diego>
 <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
 <9_7qTfdNSViwtNUGq9D13w@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x7tmavbsaviu3rdb"
Content-Disposition: inline
In-Reply-To: <9_7qTfdNSViwtNUGq9D13w@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.450.56
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_195110_888861_795BE048 
X-CRM114-Status: GOOD (  36.70  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--x7tmavbsaviu3rdb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
MIME-Version: 1.0

Hi,

On Wed, Nov 11, 2026 at 10:53:28AM +0100, Heiko St=C3=BCbner wrote:
> Am Mittwoch, 11. November 2026, 09:02:30 Mitteleurop=C3=A4ische Normalzei=
t schrieb Shawn Lin:
> > Hi Heiko
> >=20
> > =E5=9C=A8 2026/11/10 =E6=98=9F=E6=9C=9F=E4=BA=8C 16:49, Heiko St=C3=BCb=
ner =E5=86=99=E9=81=93:
> > > Am Dienstag, 10. November 2026, 09:40:44 Mitteleurop=C3=A4ische Norma=
lzeit schrieb Shawn Lin:
> > >> Cc: Simon and Finley
> > >>
> > >> =E5=9C=A8 2026/11/10 =E6=98=9F=E6=9C=9F=E4=BA=8C 15:11, Arun Iyengar=
 via B4 Relay =E5=86=99=E9=81=93:
> > >>> The MMU-600 in front of the PCIe controllers of the Rockchip RK3588
> > >>> (mmu600_pcie) is enabled for every RK3588 board, but its node descr=
ibes
> > >>> neither the power domain it lives in (RK3588_PD_PCIE) nor its clock
> > >>> (ACLK_MMU_PCIE). Both are held by any enabled PCIe controller, whic=
h is
> > >>> why nobody noticed: on a board that enables no PCIe controller in t=
hat
> > >>> domain (an Orange Pi 5 with its M.2 slot in SATA mode, or any RK3588
> > >>> board without PCIe), genpd powers the domain off and the clock fram=
ework
> > >>> gates the clock as unused after boot, while arm-smmu-v3 stays bound.
> > >>> At reboot, arm_smmu_device_shutdown() then writes CR0 and polls CR0=
ACK on
> > >>> the dead block, the interconnect stalls, "reboot: Restarting system=
" is
> > >>> never reached and the board only comes back ~90 s later when the
> > >>> watchdog fires.
> > >=20
> > > We have a work-around for that in some boards, manually disabling the
> > > smmu until now. As the SMMU is part of the SoC and always present
> > > the general DT practice is to have it always enabled, as it does not
> > > depend on the actual board design.
> > >=20
> > > Hence we end up in the situation described above.
> > >=20
> >=20
> > I notice that mmu600_php is disabled in rk3588-base.dtsi. If describing
> > the SMMU that way is incorrect, should we enable mmu600_php as well? I'm
> > asking because I see a different picture in the RK3588 TRM: both
> > mmu600_php and mmu600_pcie reside under PD_PHP, not PD_PCIE. Therefore,
> > even without any PCIe controller enabled, PD_PHP should remain powered
> > on (it is never added in rk3588-base.dtsi, so it should be outside the
> > kernel=E2=80=99s scope). How does the original problem occur in that ca=
se?
>=20
> The original problem is the smmu probing (probably during boot when
> everything is still powered), not doing anything with it and on shutdown
> the smmu driver wanting to access the smmu registers and thus ending
> in a hang.
>=20
> So the problem is not necessarily the power-domain, but can also be
> the clocks getting turned off during clk_disable_unused.
>=20
>=20
> As for not disabling it, the case is also the some for things like the
> video-encoders - they are also present all the time, so we don't have
> devicetree wiggling for them.
>=20
> The fully correct thing would be, power-domain + clock handling
> and adding runtime-pm to the smmu for when it is not in use.
> So this would then not require any special thinking
>=20
> And yes, I think the other smmu should also use the same handling.
>=20
> @Arun care to also add a runtime-pm patch? :-)

Adding runtime PM support is already WIP:

https://lore.kernel.org/all/20260929034510.2023173-1-praan@google.com/

(this is also needed to avoid potential crashes with system
suspend/resume on RK3588, since we enable PCIe IOMMU by default)

Greetings,

-- Sebastian

--x7tmavbsaviu3rdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr1N5oACgkQ2O7X88g7
+poq8Q/+P0pOInRktOpa7ipZqr7ZZw0Ry5Z09iTXZlgJa5ImtfUKuwho88ecAs+Y
AijE7yqpKPfi/a0xBUyWWdrGYWhEBZo97uvlxNlLT1I5TnPXz/8xY6fP8iW09TpN
TssTFHUZH1jwpkMZx56idljsFwIwDkhbxjApqnW0CjQi9He8qx88w6AXzHC603VH
zSxHgSpyTCkNigp7txnzxrt9x1/5PZool+9mt/ougKDtOZHaQP4r8PRqvJPcMBWr
Qmn5WjkMUSaiOGv+E7WKuBO3gz5RoymMqwGdQFG6s+TnyRxvmy7ZiJZBOZcGiR8a
NdN9Ow2Q3Mh+XrSJZj5De+LWjBRbSB5urw149w07xE/1HxOFlbpR/V8nNDlBIgXT
JoUcNTKo/NMlkj8KauGJXcQUNsaNFCIQGSngnn+FyKG5rRyiGXPuaP9cDplZcVv3
WYYMtYOxLnT3ouNJ+wq6kF8N2sVzx+ezZw1ipCXVXVu2Gl49GlAIGknuBwZLVwd7
ZoM+PwQEy/AyNQY8Maefctg5zh49lZhzA7fMV5Lcg1ErLnhuBG6qBsY8N/snDPwi
EFANmXjlRCRQ8Yot+LigovbQuOZBLfUGF5Ql0u+/t8L4eyO1I53JvsRfG0k+NoZ1
aYj+apKKbcr0SFiobCOTeHLNM9DhA132MPfpMR3sVmc7aDqDq/s=
=RkWx
-----END PGP SIGNATURE-----

--x7tmavbsaviu3rdb--

