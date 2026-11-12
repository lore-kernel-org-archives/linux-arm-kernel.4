Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38555606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UhAmz7rs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IJMMHEtB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=clfRlB1cKPI2P2RGkED2YiH8vFJqIWTsVXpS+apuAnA=; b=UhAmz7rs+UYo6xom93I6nPmVhT
	fqXj+ZFoQLXu4fz9iot4eooaTAHewBMzD2uFQyz2a55rLgszwMacyQ+qHrBUukCZNY39SN7ecNlQn
	yIanAWJWDeArEqsO0+aXCPuDHFFYiqcyPvhUrbmKn3cXNDRH4K1gRNHXqak68181VTyZhpIniSBm5
	ZrEp1ljVYRm9L0EEyNJbtqxwE+8DuxCiLP27t3Oh+A2uOUjZxo6rlLCiuXuU54O6g8yO1PL6tPsSs
	+fdWtFozc/IoBaxJtEPXUkiYBpi2AaK+c/9bALSouRNQ9s2GAB0pm9OPqby995aP85EXwgBCtYUtG
	BBF8BBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZIQ-0000000Aqus-1SOv;
	Thu, 12 Nov 2026 18:13:14 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZIH-0000000Aqtd-2Onm;
	Thu, 12 Nov 2026 18:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794507177; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eizwPx8KVqV00PIVxZYvQsUep5t+8EKtabRxDIND0DYEhcTdqV0HEincZbZl4jMyBnWDjO57rBEGXvoYXfpbg3HkTs4y6MU3iU0lLetS7vbVCPntMyD2UUnEizAg/ai7VU+CeA0Cqf2SLFUnxSipoL8EBA0OITGlE+9p3F9t/eg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794507177; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=clfRlB1cKPI2P2RGkED2YiH8vFJqIWTsVXpS+apuAnA=; 
	b=bb9NyM7Tl3qbVtWnGf6FW9HK1Qtn8fHMDmZktlw7AIiEOfmj67YsqR05Tk6oJZVJMnQyES9D69i4aEwPQAqcoeFvB1EQOh0wvZMUwo7NxvPCDbcvaxLqAZVMooYsBd/a05gvLdxRnD9kWK0VxBzP792EHRgzR2oqwK6Rp/lJ/oQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IJMMHEtBUP+0yvSM2V2o1j1rmnCiI/A+0L+4VpnDZwkTRKGalkVUCBiFKXdmQBKo4DAvnpjhvfH77y584ccLS81lzuwjDkLqc64lOxFnGQ8Qg0c5W2dgVjU4mDnlASBqpHcgFxs6A16dMZ92lGcF5xKxtxssqeTgu4ywXByRD3s=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=clfRlB1cKPI2P2RGkED2YiH8vFJqIWTsVXpS+apuAnA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794507176475603.4857356077931;
	Thu, 12 Nov 2026 10:12:56 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 97ADA180570; Thu, 12 Nov 2026 19:12:51 +0100 (CET)
Date: Thu, 12 Nov 2026 19:12:51 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Leonard Lausen <leonard@lausen.nl>
Cc: ulfh@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, detlev.casanova@collabora.com, finley.xiao@rock-chips.com, 
	zhangqing@rock-chips.com, inindev@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, gahing@gahingwoo.com
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
Message-ID: <avYBfa10mzLxG0Xe@venus>
References: <20261019092417.391522-1-leonard@lausen.nl>
 <20261019092417.391522-2-leonard@lausen.nl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3g4i4kdgz6zmtb4d"
Content-Disposition: inline
In-Reply-To: <20261019092417.391522-2-leonard@lausen.nl>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.497.36
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_101305_680278_4E8D493D 
X-CRM114-Status: GOOD (  21.72  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--3g4i4kdgz6zmtb4d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
MIME-Version: 1.0

Hi,

On Mon, Oct 19, 2026 at 09:24:15AM +0000, Leonard Lausen wrote:
> On the NanoPi M5, boot hangs during Panfrost initialization. Before this
> fix, booting required blacklisting Panfrost on the kernel command line.
> Loading Panfrost after boot reports a GPU power-domain acknowledgment
> timeout:
>=20
>   failed to get ack on domain 'gpu', val=3D0x113ff
>=20
> Add regulator support to the RK3576 domain descriptors and mark the GPU
> domain as regulator-dependent. This lets the existing Rockchip
> power-domain regulator handling manage the GPU domain supply.
>=20
> A corresponding domain-supply property is needed in the board DT.
>=20
> The regulator-capable descriptors are based on the regulator support in
> Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU settle
> delay changes.
>=20
> Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahingwo=
o.com/
> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> Signed-off-by: Leonard Lausen <leonard@lausen.nl>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  drivers/pmdomain/rockchip/pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index e193f978d5f35..b41f9fcb62bfe 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -176,41 +176,42 @@ struct rockchip_pmu {
>  	.mem_offset =3D m_offset,				\
>  	.mem_status_mask =3D (m_status),			\
>  	.repair_status_mask =3D (r_status),		\
>  	.req_offset =3D r_offset,				\
>  	.req_w_mask =3D (req) << 16,			\
>  	.req_mask =3D (req),				\
>  	.idle_mask =3D (idle),				\
>  	.ack_mask =3D (ack),				\
>  	.active_wakeup =3D wakeup,			\
>  	.need_regulator =3D regulator,			\
>  }
> =20
> -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup)	\
> +#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup, regulator)	\
>  {							\
>  	.name =3D _name,					\
>  	.pwr_offset =3D p_offset,				\
>  	.pwr_w_mask =3D (pwr) << 16,			\
>  	.pwr_mask =3D (pwr),				\
>  	.status_mask =3D (status),			\
>  	.mem_offset =3D m_offset,				\
>  	.mem_status_mask =3D (m_status),			\
>  	.repair_status_mask =3D (r_status),		\
>  	.req_offset =3D r_offset,				\
>  	.req_w_mask =3D (req) << 16,			\
>  	.req_mask =3D (req),				\
>  	.idle_mask =3D (idle),				\
>  	.clk_ungate_mask =3D (g_mask),			\
>  	.ack_mask =3D (ack),				\
>  	.active_wakeup =3D wakeup,			\
> +	.need_regulator =3D regulator,			\
>  }
> =20
>  #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulator=
)	\
>  {							\
>  	.name =3D _name,				\
>  	.pwr_w_mask =3D (pwr) << 16,			\
>  	.pwr_mask =3D (pwr),				\
>  	.status_mask =3D (status),			\
>  	.req_w_mask =3D (req) << 16,			\
>  	.req_mask =3D (req),				\
>  	.idle_mask =3D (idle),				\
>  	.ack_mask =3D (ack),				\
> @@ -250,25 +251,28 @@ struct rockchip_pmu {
>  	DOMAIN(name, pwr, status, req, req, req, wakeup)
> =20
>  #define DOMAIN_RK3528(name, pwr, req)		\
>  	DOMAIN_M(name, pwr, pwr, req, req, req, false)
> =20
>  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)		\
>  	DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeup, false)
> =20
>  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)		\
>  	DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> =20
>  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)	\
> -	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup)
> +	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup, false)
> +
> +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, wakeup)	\
> +	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup, true)
> =20
>  /*
>   * Dynamic Memory Controller may need to coordinate with us -- see
>   * rockchip_pmu_block().
>   *
>   * dmc_pmu_mutex protects registration-time races, so DMC driver doesn't=
 try to
>   * block() while we're initializing the PMU.
>   */
>  static DEFINE_MUTEX(dmc_pmu_mutex);
>  static struct rockchip_pmu *dmc_pmu;
> =20
>  /*
> @@ -1323,25 +1327,25 @@ static const struct rockchip_domain_info rk3576_p=
m_domains[] =3D {
>  	[RK3576_PD_VOP]		=3D DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(=
11), 0x0, 0x6000,  0x6000,  0x6000,  false),
>  	[RK3576_PD_VO1]		=3D DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(=
14), 0x0, BIT(12), BIT(12), 0x7000,  false),
>  	[RK3576_PD_VO0]		=3D DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(=
15), 0x0, BIT(11), BIT(11), 0x6800,  false),
>  	[RK3576_PD_USB]		=3D DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(=
16), 0x0, BIT(10), BIT(10), 0x6400,  true),
>  	[RK3576_PD_VI]		=3D DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(1=
7), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
>  	[RK3576_PD_VEPU0]	=3D DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT=
(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
>  	[RK3576_PD_VEPU1]	=3D DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT=
(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
>  	[RK3576_PD_VDEC]	=3D DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(=
20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
>  	[RK3576_PD_VPU]		=3D DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(=
21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
>  	[RK3576_PD_NPUTOP]	=3D DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BI=
T(22), 0x0, 0x18,    0x18,    0x18,    false),
>  	[RK3576_PD_NPU0]	=3D DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(=
23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
>  	[RK3576_PD_NPU1]	=3D DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(=
24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> -	[RK3576_PD_GPU]		=3D DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(=
25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> +	[RK3576_PD_GPU]		=3D DOMAIN_RK3576_R("gpu",  0x4, BIT(9),  0,      BIT(=
25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
>  };
> =20
>  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
>  	[RK3588_PD_GPU]		=3D DOMAIN_RK3588("gpu",     0x0, BIT(0),  0,       0x=
0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false, true),
>  	[RK3588_PD_NPU]		=3D DOMAIN_RK3588("npu",     0x0, BIT(1),  BIT(1),  0x=
0, 0,       0,       0x0, 0,       0,       false, true),
>  	[RK3588_PD_VCODEC]	=3D DOMAIN_RK3588("vcodec",  0x0, BIT(2),  BIT(2),  =
0x0, 0,       0,       0x0, 0,       0,       false, true),
>  	[RK3588_PD_NPUTOP]	=3D DOMAIN_RK3588("nputop",  0x0, BIT(3),  0,       =
0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false, false),
>  	[RK3588_PD_NPU1]	=3D DOMAIN_RK3588("npu1",    0x0, BIT(4),  0,       0x=
0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false, false),
>  	[RK3588_PD_NPU2]	=3D DOMAIN_RK3588("npu2",    0x0, BIT(5),  0,       0x=
0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false, false),
>  	[RK3588_PD_VENC0]	=3D DOMAIN_RK3588("venc0",   0x0, BIT(6),  0,       0=
x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false, false),
>  	[RK3588_PD_VENC1]	=3D DOMAIN_RK3588("venc1",   0x0, BIT(7),  0,       0=
x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false, false),
>  	[RK3588_PD_RKVDEC0]	=3D DOMAIN_RK3588("rkvdec0", 0x0, BIT(8),  0,      =
 0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false, false),
> --=20
> 2.47.3
>=20
>=20

--3g4i4kdgz6zmtb4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr2AZ8ACgkQ2O7X88g7
+pqTGg/+IA/3t+nqg2axgiSAxUzY6beCjQNBUt8Uqeat0ODWUyGsy0oj/YRLr1WY
cb1ByCT+vYvwI4TARthWw9G4F51pdEndZ92BKDE3Nk79a+YIcNnfyWHpUkG8mi+1
N91UDLzcJGjpp+jkkpOeVsoqQdpmdioXAjVW/bYrAEg4ee4Mbr/xe+jwxl+Sr+dt
0lRY0zDTnFVZiepgumS99iyBMNnon3vtyQAZzi/CoQ6I0F0vwN6GQYm9PdOiOxtj
nLLnRSNIuT2S0DpcK1Jev0ABWRbbXRR1fieyKLbHDpHLXiQ6yk+8XHPM9f/zLVgq
z7CPhHCkIGGX25J4TRxcrtXffezrfMcexe8yFLnV1UWStl7GLvTdgTPt96Eol44U
wZ6DJxRhohwK07cj+Q6t0X5KSDuGLkjh2SAKd5KfbqJaJpkKKNYN7YU1tDRkhUDT
2ZyKJNxI8Osbnv8QiE45SIVGTKEjsbna2aWWyJc0VgFDyX2vog4gf1bDy0k8Bygc
SlkNyfck39DpLwO/xJ7YJPAVsSv8c+YJJxOBLeRuzsxpX2R63sOaVN5ji07j2gME
nLuuVb7x7HL1kJUqISSvj6e9bb3L5daMS6K2f+kbXenoYI8MMV3rkPsCmB9wLDG0
V90g8tcYmGmi5Eu9olMlkYkMNVD2DD5ULjbJ//qZK+bako4VG4o=
=Ajkk
-----END PGP SIGNATURE-----

--3g4i4kdgz6zmtb4d--

