Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B4606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ym+Ak4TT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Ai2VeZzh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Semsacg6/GoCl+6RwK4U9eKEj09xp87pPIWCqgU37z0=; b=Ym+Ak4TTHbvLHvstVrGD7HwOr/
	KZB6Byk+0PEXbJJ4qopmaFEg+wLqg2oiygea7roQZBXRwdmSiDblP6uuFVutWGVPMqyE108g7vxzX
	OVUvQRHB93u8glHdpMg+xuizKUt055mWkuYqYEYJdV22d74KX7LPtI2jdi468b8Tly6vp/+Ks8xb8
	hDDrZ5r0NuVdq1379rknJhQbG0IYSJfTvFKalu80LYuixM4PSfNaLVe2eoyrNs/Z02SgjQqImMgdY
	lW2KW2aMbblANRMU1jUQrAud9txJm8bI9rjqLTBA5Rqwbff08hSlVV4zCJRWXPb+GKM1OO82EkFX5
	PQ/ITe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZLK-0000000ArBk-0Ffq;
	Thu, 12 Nov 2026 18:16:16 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZLG-0000000ArBG-2J11;
	Thu, 12 Nov 2026 18:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794507363; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B2h6q+jH3d4NLQnWcGv/2x1xAivo/PFPNgVTE5e/1P62z6cr518jCkub8ciJDL6kub+3WzPbFIOl1/RKwB6fmD+lOiVPigpj8CXwobPWkDI9+Y32HUYIACazGvyq/Hdjy8UhDSwEX1I7DYOlCyDuUv3YR3PKh+EYNXg/O7cdCGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794507363; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Semsacg6/GoCl+6RwK4U9eKEj09xp87pPIWCqgU37z0=; 
	b=Rnl8/ecMmjNo+YzcGCbmyCRdbXsH2KEoPI05FjxOHBjwKkY9GyaZ5++9sfJKIY+KezbvsfY/7qX57oEECI2dPXJEmRkkY4+3a+h8zv7zO5xj2cQ5jrXMxK1j9kmHKt4gh99Yg7hwZRS7td4BHTGledTzQezYm1pUJYpSM0TvspI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Ai2VeZzhBxtIqlEr6rPi6imE5AM/MTS6XsU31nFZykOuinZM9JJXDrCramaHjB/65Le7KZUloYLJvw3nskopHKtWQz/s6gks4tvZyJCLvSiDRkt3swxMdCI3eX1GmqhtFtD4WbJlvInPM1Hf0Hs9Eioav5hOWYnqIqGPwyVlPWQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=Semsacg6/GoCl+6RwK4U9eKEj09xp87pPIWCqgU37z0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794507361217249.80952065575377;
	Thu, 12 Nov 2026 10:16:01 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 71311180570; Thu, 12 Nov 2026 19:15:56 +0100 (CET)
Date: Thu, 12 Nov 2026 19:15:56 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Leonard Lausen <leonard@lausen.nl>, ulfh@kernel.org, heiko@sntech.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	detlev.casanova@collabora.com, finley.xiao@rock-chips.com, zhangqing@rock-chips.com, 
	inindev@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	gahing@gahingwoo.com
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
Message-ID: <avYBtK0fyG_0--nN@venus>
References: <20261019092417.391522-1-leonard@lausen.nl>
 <20261019092417.391522-2-leonard@lausen.nl>
 <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5zcx2h2fm6qurjpz"
Content-Disposition: inline
In-Reply-To: <CAPx+jO-9BqNgA1Nx2TiHX=BS6cJMmETepYsiujBCeeb3wPt1bQ@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.497.36
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_101610_771696_FD2F6FFC 
X-CRM114-Status: GOOD (  28.09  )
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


--5zcx2h2fm6qurjpz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] pmdomain: rockchip: Manage the RK3576 GPU domain
 supply
MIME-Version: 1.0

Hi,

On Thu, Nov 12, 2026 at 04:19:58PM +0100, Ulf Hansson wrote:
> On Mon, Oct 19, 2026 at 11:24=E2=80=AFAM Leonard Lausen <leonard@lausen.n=
l> wrote:
> >
> > On the NanoPi M5, boot hangs during Panfrost initialization. Before this
> > fix, booting required blacklisting Panfrost on the kernel command line.
> > Loading Panfrost after boot reports a GPU power-domain acknowledgment
> > timeout:
> >
> >   failed to get ack on domain 'gpu', val=3D0x113ff
> >
> > Add regulator support to the RK3576 domain descriptors and mark the GPU
> > domain as regulator-dependent. This lets the existing Rockchip
> > power-domain regulator handling manage the GPU domain supply.
> >
> > A corresponding domain-supply property is needed in the board DT.
> >
> > The regulator-capable descriptors are based on the regulator support in
> > Jiaxing Hu's pending RK3576 NPU enablement series, without its NPU sett=
le
> > delay changes.
> >
> > Link: https://lore.kernel.org/all/20260924102135.92217-10-gahing@gahing=
woo.com/
> > Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> > Signed-off-by: Leonard Lausen <leonard@lausen.nl>
>=20
> So this should be applied as a fix and tagged for stable kernels, right?

Maybe like this, considering it requires regulator support, which
landed in db6df2e3fc16 ("pmdomain: rockchip: add regulator
support"):

Cc: stable@vger.kernel.org # v6.15+

Greetings,

-- Sebastian

>=20
> Kind regards
> Uffe
>=20
> >
> > ---
> >  drivers/pmdomain/rockchip/pm-domains.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/=
rockchip/pm-domains.c
> > index e193f978d5f35..b41f9fcb62bfe 100644
> > --- a/drivers/pmdomain/rockchip/pm-domains.c
> > +++ b/drivers/pmdomain/rockchip/pm-domains.c
> > @@ -176,41 +176,42 @@ struct rockchip_pmu {
> >         .mem_offset =3D m_offset,                         \
> >         .mem_status_mask =3D (m_status),                  \
> >         .repair_status_mask =3D (r_status),               \
> >         .req_offset =3D r_offset,                         \
> >         .req_w_mask =3D (req) << 16,                      \
> >         .req_mask =3D (req),                              \
> >         .idle_mask =3D (idle),                            \
> >         .ack_mask =3D (ack),                              \
> >         .active_wakeup =3D wakeup,                        \
> >         .need_regulator =3D regulator,                    \
> >  }
> >
> > -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_statu=
s, r_status, r_offset, req, idle, ack, g_mask, wakeup)   \
> > +#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_statu=
s, r_status, r_offset, req, idle, ack, g_mask, wakeup, regulator)        \
> >  {                                                      \
> >         .name =3D _name,                                  \
> >         .pwr_offset =3D p_offset,                         \
> >         .pwr_w_mask =3D (pwr) << 16,                      \
> >         .pwr_mask =3D (pwr),                              \
> >         .status_mask =3D (status),                        \
> >         .mem_offset =3D m_offset,                         \
> >         .mem_status_mask =3D (m_status),                  \
> >         .repair_status_mask =3D (r_status),               \
> >         .req_offset =3D r_offset,                         \
> >         .req_w_mask =3D (req) << 16,                      \
> >         .req_mask =3D (req),                              \
> >         .idle_mask =3D (idle),                            \
> >         .clk_ungate_mask =3D (g_mask),                    \
> >         .ack_mask =3D (ack),                              \
> >         .active_wakeup =3D wakeup,                        \
> > +       .need_regulator =3D regulator,                    \
> >  }
> >
> >  #define DOMAIN_M_R(_name, pwr, status, req, idle, ack, wakeup, regulat=
or)      \
> >  {                                                      \
> >         .name =3D _name,                          \
> >         .pwr_w_mask =3D (pwr) << 16,                      \
> >         .pwr_mask =3D (pwr),                              \
> >         .status_mask =3D (status),                        \
> >         .req_w_mask =3D (req) << 16,                      \
> >         .req_mask =3D (req),                              \
> >         .idle_mask =3D (idle),                            \
> >         .ack_mask =3D (ack),                              \
> > @@ -250,25 +251,28 @@ struct rockchip_pmu {
> >         DOMAIN(name, pwr, status, req, req, req, wakeup)
> >
> >  #define DOMAIN_RK3528(name, pwr, req)          \
> >         DOMAIN_M(name, pwr, pwr, req, req, req, false)
> >
> >  #define DOMAIN_RK3562(name, pwr, req, g_mask, mem, wakeup)            =
 \
> >         DOMAIN_M_G_SD(name, pwr, pwr, req, req, req, g_mask, mem, wakeu=
p, false)
> >
> >  #define DOMAIN_RK3568(name, pwr, req, wakeup, regulator)              =
 \
> >         DOMAIN_M_R(name, pwr, pwr, req, req, req, wakeup, regulator)
> >
> >  #define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset,=
 req, idle, g_mask, wakeup)      \
> > -       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, wakeup)
> > +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, wakeup, false)
> > +
> > +#define DOMAIN_RK3576_R(name, p_offset, pwr, status, r_status, r_offse=
t, req, idle, g_mask, wakeup)    \
> > +       DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_stat=
us, r_offset, req, idle, idle, g_mask, wakeup, true)
> >
> >  /*
> >   * Dynamic Memory Controller may need to coordinate with us -- see
> >   * rockchip_pmu_block().
> >   *
> >   * dmc_pmu_mutex protects registration-time races, so DMC driver doesn=
't try to
> >   * block() while we're initializing the PMU.
> >   */
> >  static DEFINE_MUTEX(dmc_pmu_mutex);
> >  static struct rockchip_pmu *dmc_pmu;
> >
> >  /*
> > @@ -1323,25 +1327,25 @@ static const struct rockchip_domain_info rk3576=
_pm_domains[] =3D {
> >         [RK3576_PD_VOP]         =3D DOMAIN_RK3576("vop",    0x0, BIT(11=
), 0,      BIT(11), 0x0, 0x6000,  0x6000,  0x6000,  false),
> >         [RK3576_PD_VO1]         =3D DOMAIN_RK3576("vo1",    0x0, BIT(14=
), 0,      BIT(14), 0x0, BIT(12), BIT(12), 0x7000,  false),
> >         [RK3576_PD_VO0]         =3D DOMAIN_RK3576("vo0",    0x0, BIT(15=
), 0,      BIT(15), 0x0, BIT(11), BIT(11), 0x6800,  false),
> >         [RK3576_PD_USB]         =3D DOMAIN_RK3576("usb",    0x4, BIT(0)=
,  0,      BIT(16), 0x0, BIT(10), BIT(10), 0x6400,  true),
> >         [RK3576_PD_VI]          =3D DOMAIN_RK3576("vi",     0x4, BIT(1)=
,  0,      BIT(17), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
> >         [RK3576_PD_VEPU0]       =3D DOMAIN_RK3576("vepu0",  0x4, BIT(2)=
,  0,      BIT(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
> >         [RK3576_PD_VEPU1]       =3D DOMAIN_RK3576("vepu1",  0x4, BIT(3)=
,  0,      BIT(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
> >         [RK3576_PD_VDEC]        =3D DOMAIN_RK3576("vdec",   0x4, BIT(4)=
,  0,      BIT(20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
> >         [RK3576_PD_VPU]         =3D DOMAIN_RK3576("vpu",    0x4, BIT(5)=
,  0,      BIT(21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
> >         [RK3576_PD_NPUTOP]      =3D DOMAIN_RK3576("nputop", 0x4, BIT(6)=
,  0,      BIT(22), 0x0, 0x18,    0x18,    0x18,    false),
> >         [RK3576_PD_NPU0]        =3D DOMAIN_RK3576("npu0",   0x4, BIT(7)=
,  0,      BIT(23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
> >         [RK3576_PD_NPU1]        =3D DOMAIN_RK3576("npu1",   0x4, BIT(8)=
,  0,      BIT(24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> > -       [RK3576_PD_GPU]         =3D DOMAIN_RK3576("gpu",    0x4, BIT(9)=
,  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> > +       [RK3576_PD_GPU]         =3D DOMAIN_RK3576_R("gpu",  0x4, BIT(9)=
,  0,      BIT(25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> >  };
> >
> >  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
> >         [RK3588_PD_GPU]         =3D DOMAIN_RK3588("gpu",     0x0, BIT(0=
),  0,       0x0, 0,       BIT(1),  0x0, BIT(0),  BIT(0),  false, true),
> >         [RK3588_PD_NPU]         =3D DOMAIN_RK3588("npu",     0x0, BIT(1=
),  BIT(1),  0x0, 0,       0,       0x0, 0,       0,       false, true),
> >         [RK3588_PD_VCODEC]      =3D DOMAIN_RK3588("vcodec",  0x0, BIT(2=
),  BIT(2),  0x0, 0,       0,       0x0, 0,       0,       false, true),
> >         [RK3588_PD_NPUTOP]      =3D DOMAIN_RK3588("nputop",  0x0, BIT(3=
),  0,       0x0, BIT(11), BIT(2),  0x0, BIT(1),  BIT(1),  false, false),
> >         [RK3588_PD_NPU1]        =3D DOMAIN_RK3588("npu1",    0x0, BIT(4=
),  0,       0x0, BIT(12), BIT(3),  0x0, BIT(2),  BIT(2),  false, false),
> >         [RK3588_PD_NPU2]        =3D DOMAIN_RK3588("npu2",    0x0, BIT(5=
),  0,       0x0, BIT(13), BIT(4),  0x0, BIT(3),  BIT(3),  false, false),
> >         [RK3588_PD_VENC0]       =3D DOMAIN_RK3588("venc0",   0x0, BIT(6=
),  0,       0x0, BIT(14), BIT(5),  0x0, BIT(4),  BIT(4),  false, false),
> >         [RK3588_PD_VENC1]       =3D DOMAIN_RK3588("venc1",   0x0, BIT(7=
),  0,       0x0, BIT(15), BIT(6),  0x0, BIT(5),  BIT(5),  false, false),
> >         [RK3588_PD_RKVDEC0]     =3D DOMAIN_RK3588("rkvdec0", 0x0, BIT(8=
),  0,       0x0, BIT(16), BIT(7),  0x0, BIT(6),  BIT(6),  false, false),
> > --
> > 2.47.3
> >
>=20

--5zcx2h2fm6qurjpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr2AlwACgkQ2O7X88g7
+pomRw//Vy28e5S3U8Xq+wL8/3swnV8hyyJdJ15VDtaH/nF6fanHTovYhAgBlQKO
BbW37+FAIryXSJ4Gqu4lziI3oAcVt1+qhggpppDlbiGnZZYh7Uv9+SWIKklYVSoA
F222rvCnaiXVJi57VkcC+oH1bGMG8VYYI+5YkeYeTDhPJFvc4kwj6obpnxGPNRCp
K+NOvLMsOXOQh9tfqWKQ4FVKO5Ub6+69PjgQLLa+5ut5phORRKQOUHjdBgLxO50m
/l3HUzkXnLKx6wT275yNDpsur/MJWlTjmwo/EtnKmkBUp3V+VeFGq8zZa6wUCoGH
nhbtXTcBKuKeZ+m7t/jqqe93ssz3RuIlQy5CJ/OVsm2D9lsTw0i2n2ttXmfnxEEE
udR+qVmvVK4Q67cLbEWMxEJ7OvDpCumc68by0HCyZgzzyLe8Nofk0NiTl3jbS9b9
p2j/JoyzP9Ts0F+XFdTgEzIu6nxIsTwpcjIgXJ0ejCugBf7NvXcDQXUOaXgEGQ+J
54xqFYpOvaIa+TZB0dhrODO2zqkSiSLDHmEN+X+wuUlMZCrcyvkd4+j5PGbS42UP
QuyDN+Cay0yff6JU85A33uO6yru6zJ53SDQ7zGX15vuSMTnlFr0sgyJZDgtvwypV
eGgUZ+6AilAkSJ7+NvQLmuQGDC7zJUPtWcL55pyxo8ZCk+5tijU=
=Qk2q
-----END PGP SIGNATURE-----

--5zcx2h2fm6qurjpz--

