Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A02606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljXO+8ET;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BPzv4Tnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r+/t7/8YlFHnxsyLwpkOiW86h8l2cQmKlSVSUVvhfg4=; b=ljXO+8ETJPc4Tkiio/re8R22/n
	C3Fa3XJGag46Fm73XlPZwnY1ouHq9OidB7Cxitv6iy04qV5dclC5lEDkLiK4A1PtBBdRn7A+uQcNK
	Z1h5QpoGb/TuD/+ItwIKMqR+mzbZwkUnCJzlKQJ+3btLkLdhrYCXUxDzgkXwopf2IELTGnqZ9JgF+
	/BqRQHuw/x2HAJY5RO5JaoAok+Tbl4f1eAi66mpowMPjiLYbu/MUEN/Fm9fO8eNUPpIHV6FbezKkR
	aArxHhldxAYzwzHGU0VkepH2Mm0XDn/44qzycTbiPnV+WFbvv/eGURN3/Q3Z8tezWtVMvVE9GMfAe
	yFQXAwoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpo0-00000001Cmw-0KRu;
	Mon, 16 Nov 2026 06:03:04 +0000
Received: from sender6-op-o11.zoho.com ([165.173.180.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpny-00000001Clb-1AnK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:03:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794808971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K5TCXXI91b4b+txGC66v91ASkAjS9cetSVj7d/0V4cs2bSj32Q63apZ8Gf4nnDxmUbc3Bfoq7FzjesXhcTh8jLR+v6sMC0aK8G/gkqmYKYRIZmNggTGwBimrrOx+dymBST4SYKYKUWOaBx/PYHTfq4AYhdDjcO0Qou02f7+4wiI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794808971; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=r+/t7/8YlFHnxsyLwpkOiW86h8l2cQmKlSVSUVvhfg4=; 
	b=Jnuw0291o9TrCJBgScPHwVi6QuzLkpKFCAq7+BPYTDdbhrtmk1KvlPYPlgmd+0OoWA92zmTsFmW2x8ihNjiqMh+VDnpvtjGERlGD9f6VnUhl3Nd3gmqBH794rBzqHFxGCN7LoQQQopQgaVIh1EC5ChtDPFdrVneSgd73HIK15qg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BPzv4Tnt3rbd+kB/+LiC0k9cl4wMgaKyeTr0ktragr8t67a9BcCteaOKXt5ASdVoieL/1+C1DS7C8JaPy5I1XCFzAzD7cWhlbMZUIfCL4GWe25Qm4nc7NySHLRZ8GMACYdDzK5XxVtUGt9/n4GjSSup52oBKDSDW1nye/o/dr8o=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=r+/t7/8YlFHnxsyLwpkOiW86h8l2cQmKlSVSUVvhfg4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794808969440383.91187333815697;
	Sun, 15 Nov 2026 22:02:49 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 564A0180311; Mon, 16 Nov 2026 00:08:05 +0100 (CET)
Date: Mon, 16 Nov 2026 00:08:05 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, John Stultz <john.stultz@linaro.org>, 
	Moritz Fischer <moritz.fischer@ettus.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Yan <andyshrk@163.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v27 06/10] power: reset: Add psci-reboot-mode driver
Message-ID: <avo65hxiVDxpJRn-@venus>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-6-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vbu6xkkak2iqrbaw"
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-6-fa4b3ff1359b@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220302_443810_27C1E0F2 
X-CRM114-Status: GOOD (  37.85  )
X-Spam-Score: -0.6 (/)
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--vbu6xkkak2iqrbaw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v27 06/10] power: reset: Add psci-reboot-mode driver
MIME-Version: 1.0

Hi,

On Thu, Oct 29, 2026 at 02:31:00PM +0530, Shivendra Pratap wrote:
> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>=20
> Add psci-reboot-mode as an auxiliary device created by the psci-devices
> driver. Define two types of PSCI resets, predefined-resets and
> vendor-specific resets. Predefined-resets are defined by psci driver
> and vendor-specific resets are defined by SoC vendors, under the
> psci:reboot-mode node of SoC device tree.
>=20
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>=20
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>=20
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                            |   1 +
>  drivers/firmware/psci/psci-devices.c   |   4 ++
>  drivers/power/reset/Kconfig            |  11 ++++
>  drivers/power/reset/Makefile           |   1 +
>  drivers/power/reset/psci-reboot-mode.c | 101 +++++++++++++++++++++++++++=
++++++
>  5 files changed, 118 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e4ca41cdd872..0e03826eec48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22292,6 +22292,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderate=
d for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/psci.yaml
>  F:	drivers/firmware/psci/
> +F:	drivers/power/reset/psci-reboot-mode.c
>  F:	include/linux/psci.h
>  F:	include/uapi/linux/psci.h
> =20
> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci=
/psci-devices.c
> index d23befc490ed..04f24b8d9943 100644
> --- a/drivers/firmware/psci/psci-devices.c
> +++ b/drivers/firmware/psci/psci-devices.c
> @@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devi=
ces[] =3D {
>  	{
>  		.name =3D "psci-cpuidle-domain",
>  	},
> +	{
> +		.name =3D "psci-reboot-mode",
> +		.of_node_name =3D "reboot-mode",
> +	},
>  };
> =20
>  static void arm_psci_auxiliary_device_release(struct device *dev)
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index bce996bbef28..f165a41d40ed 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
>  	  then the bootloader can read it and take different
>  	  action according to the mode.
> =20
> +config PSCI_REBOOT_MODE
> +	bool "PSCI reboot mode driver"
> +	depends on ARM_PSCI_DEVICES
> +	select AUXILIARY_BUS
> +	select REBOOT_MODE
> +	help
> +	  Say y here to enable the PSCI reboot mode driver. The driver
> +	  registers with the reboot-mode framework to configure PSCI
> +	  reset commands, which are executed by the PSCI driver during
> +	  psci_sys_reset().
> +
>  config POWER_MLXBF
>  	tristate "Mellanox BlueField power handling driver"
>  	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
> index e31cab4ba78e..45d8aaaffaa1 100644
> --- a/drivers/power/reset/Makefile
> +++ b/drivers/power/reset/Makefile
> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) +=3D reboot-mode.o
>  obj-$(CONFIG_SYSCON_REBOOT_MODE) +=3D syscon-reboot-mode.o
>  obj-$(CONFIG_POWER_RESET_SC27XX) +=3D sc27xx-poweroff.o
>  obj-$(CONFIG_NVMEM_REBOOT_MODE) +=3D nvmem-reboot-mode.o
> +obj-$(CONFIG_PSCI_REBOOT_MODE) +=3D psci-reboot-mode.o
>  obj-$(CONFIG_POWER_MLXBF) +=3D pwr-mlxbf.o
>  obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) +=3D qemu-virt-ctrl.o
> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset=
/psci-reboot-mode.c
> new file mode 100644
> index 000000000000..c5dcfc40392a
> --- /dev/null
> +++ b/drivers/power/reset/psci-reboot-mode.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/psci.h>
> +#include <linux/reboot-mode.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +
> +/*
> + * Predefined modes use two arguments. arg1/magic[0] is always zero and
> + * arg2/magic[1] is one of the values defined by enum psci_standard_rese=
ts.
> + */
> +static const struct reboot_mode_entry psci_resets[] =3D {
> +	{
> +		.name  =3D "psci-system-reset",
> +		.magic =3D { 0, PSCI_SYSTEM_RESET_COLD_RESET },
> +		.count =3D 2,
> +	},
> +	{
> +		.name  =3D "psci-system-reset2-arch-warm-reset",
> +		.magic =3D { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
> +		.count =3D 2,
> +	},
> +};
> +
> +static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
> +{
> +	u64 cookie =3D 0;
> +	int i;
> +
> +	/*
> +	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 =
bits.
> +	 * For a 2-cell magic, arg2 is the low 32 bits.
> +	 */
> +	for (i =3D 1; i < count; i++)
> +		cookie =3D (cookie << 32) | magic[i];
> +
> +	return cookie;
> +}
> +
> +static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
> +				  const u32 *magic, u32 count)
> +{
> +	if (count < 2 || count > 3)
> +		return -EINVAL;
> +
> +	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
> +	if (!IS_ENABLED(CONFIG_64BIT) && count =3D=3D 3 && magic[1])
> +		return -EINVAL;
> +
> +	return psci_set_reset_cmd(magic[0],
> +				  psci_reboot_mode_get_cookie(magic, count));
> +}
> +
> +static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
> +				  const struct auxiliary_device_id *id)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device *dev =3D &auxdev->dev;
> +	size_t count;
> +	int ret;
> +
> +	reboot =3D devm_kzalloc(dev, sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot)
> +		return -ENOMEM;

reboot =3D devm_kzalloc_obj(dev, *reboot);

Otherwise:

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

> +	/* Skip PSCI SYSTEM_RESET2 modes if unsupported. */
> +	count =3D psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : =
1;
> +
> +	ret =3D reboot_mode_driver_init(reboot, dev, NULL,
> +				      psci_reboot_mode_write, psci_resets,
> +				      count);
> +	if (ret)
> +		return ret;
> +
> +	return devm_reboot_mode_register(dev, reboot);
> +}
> +
> +static const struct auxiliary_device_id psci_reboot_mode_id_table[] =3D {
> +	{ .name =3D "arm-psci.psci-reboot-mode" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, psci_reboot_mode_id_table);
> +
> +static struct auxiliary_driver psci_reboot_mode_driver =3D {
> +	.probe =3D psci_reboot_mode_probe,
> +	.id_table =3D psci_reboot_mode_id_table,
> +};
> +
> +static int __init psci_reboot_mode_init(void)
> +{
> +	return __auxiliary_driver_register(&psci_reboot_mode_driver, THIS_MODUL=
E,
> +					   "psci-reboot-mode");
> +}
> +subsys_initcall(psci_reboot_mode_init);
>=20
> --=20
> 2.34.1
>=20
>=20

--vbu6xkkak2iqrbaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr6O1EACgkQ2O7X88g7
+prhkxAAkQuin46I3uFGGGhE7nFR3h670j7HVzveY3wJZBIbqbghMQNnj4IJF+LD
ApLl3NuqeBFiGAs52wuZzF3gdLrVQx8xqJHQQ2OYzLligrbYL1kAD4mrouWSKWjN
+af+VTAieHX9dg29j7BlapvuCWSgZwHGkVjErtZ5s3pxrc5x+NMpkAJX4aU5Br5I
M6rt/lkj2/tXvKejS/P/VISj+XaO6Vw+dKZTAwlvAE5XZ7RUcb5XH0cBIB4QVlZC
81FnfMbZXQWddCg0pcUNBuxAsxRH7cKppI7wOygCqWhsghpUQnUPBPC+gg193Ioy
t4D6KbEqMIpGktUf1TNS6HYKrSrH/nh6kv/QN+8/dyTNO+xCOOBeSZZ4rY+trdku
3/HrKiqUtQh3kDKKTZb214ckMObSp+dzMsX87CGUDFnei3zqYU3cIkFhtKCfjqKX
1GA6ckI710xIt/Bdg4p8jZ5cnr9ZnMUBcD4vskv6WvCi6TeZ1uheN0tEZYIfzc4k
/gT7yi0SRLgF7qmmbxti0AgRyUacBdmLruWUrzRluI9uvU9oPcvRpw+xn1w/oc0o
Vfa/EzBEyFa3jCo9Qd0KtSwa/dcN+x0M9ZOKl4txc9ifWGZxOZrr1dhtTEepCMZT
4wJLnPGNFe7VNYM1DCvF8PgurVJn8UcAUqvPZw/vqvnU4bfjREg=
=0rLe
-----END PGP SIGNATURE-----

--vbu6xkkak2iqrbaw--

