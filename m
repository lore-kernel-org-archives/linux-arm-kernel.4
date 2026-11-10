Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6465606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6YTSblU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=LnS20fwW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1nscl7aZNwOtv842vwFmJ0HuXa6txcAWMb0wIM3bg7A=; b=Q6YTSblUFLT13s5ngJ0NIU8ans
	I21Ti6sg2n1oi15Hcft+StFk6zSy6vZaOuHApcdrFKjX/OTmUQZHYpkADKaYx6Z1wSFMEC7VYwxeE
	ULUDaYpWvwRCdeiJ7K5oLxhpCVUsQS0BGVt2lXwgmhbmIT3bk/gWmbaxMELOXC1U9VEOLJzwDRInB
	sBMjePb+9kyax6iW+oEzPFw4b+hEcp94UAwGYJi5XLIG/ylrAsZRfDIGTfuoF+lu4R6BWMvAj7a8W
	oX3juRs/vbSku1gZSLKpZUJoiGwdm+NMwhPW0TKpBFrusfHAf0Qq4KbZaFbRuLsnMO/TVC7/tZ1dK
	GhZhAChQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnEU-00000004HWU-2OX8;
	Tue, 10 Nov 2026 14:53:58 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnER-00000004HW1-26Ov;
	Tue, 10 Nov 2026 14:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794322424; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UQSDQPeWhfDIklKZ7AQ4NwCZKHSdWUX/rrRc047HEmYw+aETLagSI4a9TAIEG14IcNGL8ymrGQi6OqZrBdm72lGeJXqjG//Te9khom1dWxsIqTwWFBGu6xXvMlkOU8uD/YOJGmOVyQdhle3ryB9qGy76eJ0u9nCR20RbwS9rr+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794322424; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1nscl7aZNwOtv842vwFmJ0HuXa6txcAWMb0wIM3bg7A=; 
	b=i6Hdhl3LW9WWmxNJMIJv0NFXuWqWKsV72EAfdGP/d3Dgykm7kjpX7jcmm40kemY6mbp8TilQJVAgo2/OVMweLpMI3yLnddctKZ6sI54PEs8NeuZ35CjNtI+uTmZMUGM27Vn5OPDg6h0SKEuDwYXT4z74OLcaOwsvcS7K0FDkvfg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=LnS20fwWU9doICCJkO1+lTngxmeRJLeTmQxP2EXQ9bP0uSEb9wxc+bD/UKHee2lakzRDGm4FJbQg/0tmwGt7iTYbFr6liiSlrMUKT70SiXzC+mVv2K3pll3en/EjvAwbCZW5g8JKpa44Y9+RTbtRVUZrWO5iCFZTC7JhPpdWEy0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=1nscl7aZNwOtv842vwFmJ0HuXa6txcAWMb0wIM3bg7A=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794322422153362.1328994697353;
	Tue, 10 Nov 2026 06:53:42 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id A4C1E180354; Tue, 10 Nov 2026 15:53:28 +0100 (CET)
Date: Tue, 10 Nov 2026 15:53:28 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/5] iommu/arm-smmu-v3: enable optional clocks
Message-ID: <avMvinXkzBpaRh5K@venus>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <20261110-smmu-v3-pcie-pd-v1-3-628819ca44b9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j6dulos5oufpuo7z"
Content-Disposition: inline
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-3-628819ca44b9@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.310.16
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065355_674314_429B23F2 
X-CRM114-Status: GOOD (  22.91  )
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


--j6dulos5oufpuo7z
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] iommu/arm-smmu-v3: enable optional clocks
MIME-Version: 1.0

Hi,

On Tue, Nov 10, 2026 at 07:11:50AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On some platforms the SMMU's clock is controlled by the OS, and without a
> consumer the clock framework gates it as unused late in boot. Any later
> register access, for example the CR0 write in the shutdown path, then
> stalls the interconnect. This happens on the RK3588 when no PCIe
> controller keeps the PCIe MMU-600 clock running.
>=20
> Get and enable all clocks described in the firmware node before the
> registers are first accessed, and keep them enabled while the driver is
> bound. Nodes without clocks are not affected.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/=
arm/arm-smmu-v3/arm-smmu-v3.c
> index 6d4520c47308..cce66db93219 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/acpi_iort.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/crash_dump.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> @@ -5786,6 +5787,7 @@ static int arm_smmu_device_probe(struct platform_de=
vice *pdev)
>  	resource_size_t ioaddr;
>  	struct arm_smmu_device *smmu;
>  	struct device *dev =3D &pdev->dev;
> +	struct clk_bulk_data *clks;
> =20
>  	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>  	if (!smmu)
> @@ -5800,6 +5802,11 @@ static int arm_smmu_device_probe(struct platform_d=
evice *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	/* Optional clocks: keep them running for as long as we are bound */

useless comment, otherwise

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

> +	ret =3D devm_clk_bulk_get_all_enabled(dev, &clks);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
>  	smmu =3D arm_smmu_impl_probe(smmu);
>  	if (IS_ERR(smmu))
>  		return PTR_ERR(smmu);
>=20
> --=20
> 2.55.0
>=20
>=20
>=20

--j6dulos5oufpuo7z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmrzL+gACgkQ2O7X88g7
+prUgg/+JNEo0SPEnyobWdRYPSOZu/Tn9RCGlBzIehkk0TD0d2SvMuDPacuxM6iy
msiz8nlhpfkagYAKp9ojnjS8MIDJ98u/AihAlgXj6PaLeWVLhUaN62zkKgYEB7pN
eAK6AZNCaLAKTDfQUhnAS5Ts4DFqhfo2kURK/5sLoKgvgCEIVJIBQsISRtOgxnYp
w+rqmAj1so634w7NXLzLt2hCL93EZxSfQWJFjWzAX4pSR0YtRYM+g9NZiO2G/YHj
Aip92FBnkjVXbl0+DAPnQJ3PTjWIWABxwp4DLs/WfkiOHSv59z6rXW7iluR/+5y1
6e2T21bQnoAmbGsTKpZbTT6UUkLCfXDfIc4bIFqWQR604Gb37xENkUsq8elOzIfT
oj4ObXRhUCUlurV2tVjAmYqlbXKrVEEhI+pnTvbg3aNmj/12fT5wtOZsaSGg8FVW
nTjMYzcj+geSNOKvi/asIOFV8jR6fIl7TwOS7u/ojoTlCvAJ2V77g8l5+u/8qnA/
Phw3tKaaoahqi7m84zxDyc1oXAwvUvz0kDZIg8ZEUm6fRr1W53LILDMvMgIrRTcL
qmzlHQJlx+PhspiX+kE7kwCp8dFmhcndqnlZwsTcIdxkGJJQnhM0Anrq0k3x6omB
OI5FfL+iINUvWHew81mwzujVKxBgxcYpbbfxo2ySecCSc5HmH0A=
=10on
-----END PGP SIGNATURE-----

--j6dulos5oufpuo7z--

