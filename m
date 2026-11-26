Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB79606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K1jlImNO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=M46VGZc8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1uwUfdoO2tZn9/T6hpBts/o6K5tW0x82owJfGpBjksM=; b=K1jlImNO5q4Kn7MM72iBBGH3jo
	ByaTjCXlSxVoka+UV98Mjxke+D7+XsStfcmT7cwe1+hXqX0hSDnSU4mvpPYrc2PPlxJXFoihVGUev
	bMqwkvVDPBgnH6VUd7oQPqIvDTVupD/IdP7Djvve8Di0tUKSPVfqbN6IrUw98HjamtPFMzu1fjYTc
	I7sjoy9sdr4NwkSn2o3d72vw2YIjknfVRkO/bIud5R+h3hUw8tD/LNGmqKn9Wx1NssKesndokikCX
	5gjiuloUpmSYtNeZyqGIaIY23LMvjmd1gwOB9tbiQiV7GJt+cyIIJ7XvXa85qyJkhbl1O2+MtsRu8
	zh2y13xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWUG-0000000CikL-33p5;
	Thu, 26 Nov 2026 10:13:56 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWUE-0000000Cijx-1EFD;
	Thu, 26 Nov 2026 10:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795688029; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FEKYPcf0ZahrNVgYr4P69tIWo7QWRD59zHUNVwhLfdnaHUVlX3Lf98cNyzlxx+yxdpl7zIo6uGjx+0MHmKh6Sh4c20pNQq/UGyF0g0qlavYdfZS+3ZdtDa2Ex9+OUYuIAgVwJvDj7ZhfrURIZMRIj1udTUhEwIOqicWhXPsW/Pw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795688029; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1uwUfdoO2tZn9/T6hpBts/o6K5tW0x82owJfGpBjksM=; 
	b=YMK24uA7i7q/7bZ39bGaR7Kk3GGIKyqKP8bdZ/7LWVonlwjgwjL8vl1Ltb4iM7O+ZM1/kg6UPGyBlIroi1dLv5+L9kXoXvGKooZoz3HZvaBqbGmVJiUbkfGtDjfexpEMvEoOWLdlm3tIrHpghdqPppQcNB8Xrb64sN0eosh3IZg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=M46VGZc8Vp3HDlDTtJgWb3/jv13b7Ol0fD6XZ8z56pfZPIaWtEfLv+QovrWC/cJHITUpE+9FqRLPh/xojUYxGkmO6i6takle3ik7udQkhuMj5R0vYlbZ5+/qCBHsGoZk8HPHIA0xv3hK12oRPRw/7XyVF+WUzDKpiwqS98fc+B0=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=1uwUfdoO2tZn9/T6hpBts/o6K5tW0x82owJfGpBjksM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795688026107369.88534777876225;
	Thu, 26 Nov 2026 02:13:46 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id ED61718040B; Thu, 26 Nov 2026 11:13:40 +0100 (CET)
Date: Thu, 26 Nov 2026 11:13:40 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: aiyengar1990@gmail.com
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Pranjal Shrivastava <praan@google.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
	Finley Xiao <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-v3: Enable an optional clock
Message-ID: <awgFSStwki6ytKsQ@venus>
References: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
 <20261126-smmu-v3-pcie-pd-v4-2-c340c2dbd1d2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="trvqlmcklbkkvnwt"
Content-Disposition: inline
In-Reply-To: <20261126-smmu-v3-pcie-pd-v4-2-c340c2dbd1d2@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.675.79
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_021354_378269_4471D310 
X-CRM114-Status: GOOD (  22.14  )
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


--trvqlmcklbkkvnwt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-v3: Enable an optional clock
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 09:54:14AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> On the RK3588 the PCIe SMMU's clock is gated as unused when no PCIe
> controller holds it, and the CR0 write at shutdown then hangs. Enable
> the clock from the firmware node, if any, while the driver is bound.
>=20
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---

Once runtime PM support lands [0], this should move to runtime PM
resume. But at the moment it looks sensible:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

[0] https://lore.kernel.org/linux-iommu/20260929034510.2023173-1-praan@goog=
le.com/

>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/=
arm/arm-smmu-v3/arm-smmu-v3.c
> index 100b34f07032..beea222dcf57 100644
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
> @@ -5786,12 +5787,19 @@ static int arm_smmu_device_probe(struct platform_=
device *pdev)
>  	resource_size_t ioaddr;
>  	struct arm_smmu_device *smmu;
>  	struct device *dev =3D &pdev->dev;
> +	struct clk *clk;
> =20
>  	smmu =3D devm_kzalloc_obj(dev, *smmu);
>  	if (!smmu)
>  		return -ENOMEM;
>  	smmu->dev =3D dev;
> =20
> +	/* Before the firmware probe, which may take a CMDQV reference */
> +	clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
>  	if (dev->of_node) {
>  		ret =3D arm_smmu_device_dt_probe(pdev, smmu);
>  	} else {
>=20
> --=20
> 2.55.0
>=20
>=20

--trvqlmcklbkkvnwt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIBlQACgkQ2O7X88g7
+prL+w/9GJRhofBue91qCCzLZC9a3SdI+xVa3C+37ewGeBXjRN8WQ3oQJAEIgMDa
UV1CJIg0QPveTd4D8M+1AIRKYEV5d6W7793UGpPK7zdalFdolIxw5cpxjlO3Lynv
lZhCccXEEg/93BC9NPlFPWk3QaFWA88/ZrSnwX70q6vlafKhe/tJgVhKgjQh/gkY
d4jIOfBSg0mWEhFd8HSUHAZvltis39p0XIkjAbMTaOnSA3+zg0jHOpqK0l43263H
iOqoy/DJutYE0bwBsMmaqtx687Y4o6NUFmTiKQ+Sj58mzklx05z+lTdUJ0iftgfm
qeQtOSM+Ju9CpoerPrKZL7SatDDca1fy7YS7fFZtWiR9nHjW0Ei15DzDWD4PfdTU
tPt+WS2eNr0q2m/mCVGD9gSDYreBdbilUhm003BgZt6++u/DVb8NaMa6k3U8/zTV
RMHBV6yGPp33xV/lIpltlBz62fbonvYCvg8TMfHwoptDL5VJIvrw9D2CAkg2+fze
zo2mc8inuDpxaMMT/vQIWsSgUIYDMs1JNXRaDgVVZ25jBGXAqDZKgEUsf3buU+ks
S3VgWHft1IUtmP7mDHwPORFouSMTsuPgUIrNiVi49RZsBnPovbzEwGiBHYFBodr/
Gfjav4yl0P1OQ/KfJUcQc9DByRARuWfatt4zweqpCiRgUq0D1HI=
=fBBJ
-----END PGP SIGNATURE-----

--trvqlmcklbkkvnwt--

