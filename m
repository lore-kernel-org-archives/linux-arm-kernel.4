Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C7606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ex0ayz/g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=JN943SYq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TfDjuwkSTa5nAGjVD3B2Rb7p7mOwlMifP4wFFcu3kpI=; b=Ex0ayz/gTV94saxnpZGqlQ7/f1
	civcR0uCcT6Wmvx9MmhZiBaXDKwQfl5upI9LKcV4KL4O8GoivlGuPeCKEPkyR+HugKuL0512IMKIU
	y3mh/yjzkZYMl3lVGQiYnfh+jem9Mk2+h1gPytnNxn3mZBIgosk2RN/ahs65qh2H907vTooK+dY7K
	m3NRJlt8Pofv3i8gE+zSxSjbgPUJVeDgTRE2A7jtJxbW6Ny/lluXoMIk3UcmOs9To1sX2WetNxDw7
	hlECcPmw6Rbq2Fyf8vzCrXbfx5zzOk3CL2Suy8jZXjtpk65X7p9Zw5MUBhKqOe98R0GwoWk0XtUYf
	KsDNKOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpoA-00000001Crs-0ndm;
	Mon, 16 Nov 2026 06:03:14 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpny-00000001Clc-2fcc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794808971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i2PsOlGb9PpjAve6Ok8VQZ5JGXGHDg5j/XPpPxnlKm7ZG2WTnjW2Q4s16N8LT35F+HfzYGbQvQtVRpW2EI0aSLuyghDk/00wMDok7REnYy1XjOluU4RjiOkl+ydUTGqPX6B6uhvfmNp+Kz0IfCF9g6itsYEIqSNEfCF6i+3fS8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794808971; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TfDjuwkSTa5nAGjVD3B2Rb7p7mOwlMifP4wFFcu3kpI=; 
	b=TKptlOCfqYyFq0xOs2/sxJxdPlcrApbreSl4/oGl7b6DNsE4tV0rxpKhXlqwC9OefM28WcMnjCbJFLlio74jyLCyO3bqtkE8j55v2cVJoABGdaNcsE+sonCwGa7qp+oTgtkOqN5UA/eLSA7YW1p2hGZ0d2P9TFb8Hqs87e+tM2Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=JN943SYqgdxoztz/vj71JnRNTLT6aVcYVg45qmz3NwZ37OlBZXSJmXg5PdHcSNsqImLEWKUQg2tbDo/qMcfvCKrgTfkJ9WZyxwBRt0u8HpEiMarHNUhjqa6qDl5O/AZdGi8ulXoVLZO8evPCQOXDpFvS0jhARnzPLT+fJ3ZSWtI=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=TfDjuwkSTa5nAGjVD3B2Rb7p7mOwlMifP4wFFcu3kpI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794808969125680.7622736980674;
	Sun, 15 Nov 2026 22:02:49 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 86859180980; Mon, 16 Nov 2026 00:08:35 +0100 (CET)
Date: Mon, 16 Nov 2026 00:08:35 +0100
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
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v27 01/10] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <avo7XV2jIkT73eyb@venus>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <20261029-arm-psci-system_reset2-vendor-reboots-v27-1-fa4b3ff1359b@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="alsyczz6sdv6nhdw"
Content-Disposition: inline
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-1-fa4b3ff1359b@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220302_731047_8F21F677 
X-CRM114-Status: GOOD (  28.11  )
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


--alsyczz6sdv6nhdw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v27 01/10] power: reset: reboot-mode: Support up to 3
 magic values per mode
MIME-Version: 1.0

Hi,

On Thu, Oct 29, 2026 at 02:30:55PM +0530, Shivendra Pratap wrote:
> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
>=20
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/reset/reboot-mode.c | 46 +++++++++++++++++++++++++++------=
------
>  include/linux/reboot-mode.h       |  3 +++
>  2 files changed, 35 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index 3611bed341e1..328fa37598df 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -20,7 +20,8 @@
> =20
>  struct mode_info {
>  	const char *mode;
> -	u32 magic;
> +	u32 magic[3];
> +	u32 count;
>  	struct list_head list;
>  };
> =20
> @@ -72,8 +73,7 @@ static const struct class reboot_mode_class =3D {
>  	.dev_groups =3D reboot_mode_groups,
>  };
> =20
> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reb=
oot,
> -					  const char *cmd)
> +static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver =
*reboot, const char *cmd)
>  {
>  	const char *normal =3D "normal";
>  	struct mode_info *info;
> @@ -84,11 +84,11 @@ static unsigned int get_reboot_mode_magic(struct rebo=
ot_mode_driver *reboot,
> =20
>  	list_for_each_entry(info, &reboot->head, list)
>  		if (!strcmp(info->mode, cmd))
> -			return info->magic;
> +			return info;
> =20
>  	/* try to match again, replacing characters impossible in DT */
>  	if (strscpy(cmd_, cmd, sizeof(cmd_)) =3D=3D -E2BIG)
> -		return 0;
> +		return NULL;
> =20
>  	strreplace(cmd_, ' ', '-');
>  	strreplace(cmd_, ',', '-');
> @@ -96,21 +96,25 @@ static unsigned int get_reboot_mode_magic(struct rebo=
ot_mode_driver *reboot,
> =20
>  	list_for_each_entry(info, &reboot->head, list)
>  		if (!strcmp(info->mode, cmd_))
> -			return info->magic;
> +			return info;
> =20
> -	return 0;
> +	return NULL;
>  }
> =20
>  static int reboot_mode_notify(struct notifier_block *this,
>  			      unsigned long mode, void *cmd)
>  {
>  	struct reboot_mode_driver *reboot;
> -	unsigned int magic;
> +	struct mode_info *info;
> =20
>  	reboot =3D container_of(this, struct reboot_mode_driver, reboot_notifie=
r);
> -	magic =3D get_reboot_mode_magic(reboot, cmd);
> -	if (magic)
> -		reboot->write(reboot, magic);
> +	info =3D get_reboot_mode_info(reboot, cmd);
> +	if (info && info->count) {
> +		if (reboot->write_array)
> +			reboot->write_array(reboot, info->magic, info->count);
> +		else if (reboot->write && info->magic[0])
> +			reboot->write(reboot, info->magic[0]);
> +	}
> =20
>  	return NOTIFY_DONE;
>  }
> @@ -173,16 +177,22 @@ int reboot_mode_register(struct reboot_mode_driver =
*reboot)
>  	struct property *prop;
>  	struct device_node *np =3D reboot->dev->of_node;
>  	size_t len =3D strlen(PREFIX);
> -	u32 magic;
> +	u32 magic[3];
> +	int count;
>  	int ret;
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> =20
>  	for_each_property_of_node(np, prop) {
> +		memset(magic, 0, sizeof(magic));
> +
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> =20
> -		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +		count =3D device_property_count_u32(reboot->dev, prop->name);
> +
> +		if (count <=3D 0 || count > ARRAY_SIZE(magic) ||
> +		    device_property_read_u32_array(reboot->dev, prop->name, magic, cou=
nt)) {
>  			dev_dbg(reboot->dev, "reboot mode %s without magic number\n",
>  				prop->name);
>  			continue;
> @@ -194,7 +204,15 @@ int reboot_mode_register(struct reboot_mode_driver *=
reboot)
>  			goto error;
>  		}
> =20
> -		info->magic =3D magic;
> +		if (!memchr_inv(magic, 0, count * sizeof(u32))) {
> +			dev_dbg(reboot->dev, "reboot mode %s with zero magic values\n",
> +				prop->name);
> +			info->count =3D 0;
> +		} else {
> +			memcpy(info->magic, magic, count * sizeof(u32));
> +			info->count =3D count;
> +		}
> +
>  		info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =3D -ENOMEM;
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d6..29ae39935d69 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,10 +2,13 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
> =20
> +#include <linux/types.h>
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
>  	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> +	int (*write_array)(struct reboot_mode_driver *reboot, const u32 *magic,=
 int count);
>  	struct notifier_block reboot_notifier;
>  };
> =20
>=20
> --=20
> 2.34.1
>=20
>=20

--alsyczz6sdv6nhdw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr6O3MACgkQ2O7X88g7
+pp0uw//duMS801sh9AMsD07enJvFBwjdKh5AAOFybjtb4sVKoMZvxuwOpElII53
ccIxxTSffvWCX/EAgPh1EBtuMkjz9aXpRZP/h8wsLdJMvtRfGTu7ug3ZfU5xVGLF
7/b57wN9KU5BOc5XeoTx2OLihRlqYWZLxtxZmFIvRblOE2Rkg1Q+5C+j8SVo+2Rd
WbA+z4SASxpreKejNPq8i2OAh4z3LtAtPpkOFhw1eODzTXPAUr9nOOekizTrCB3+
snFQmDsedWxWZL8zgDbk1TDsU/43n4tKa3uFC3LePh056oB5PEPZUiIU75sJa+bj
kr+gjmLe4J5ACCCxeNhmkkBjSUkvPzpVyO7XzswTR67vbdaNLnAAG1GnvisIXbEi
x6QQzrokpzGSBjz1DNlushR3rz9Dq9qeGIWKJWmLVyBBraWkQhwoEDP5oCmY+OCK
QJwlAt2QYUWKavWWFrTlGGymoluLSwwvXPRctlR2fCfbhdWzoZy4iVwKIkMbwPoG
WiVDLjMpDR03MMIJ5hfDWL+6rkpsl6zUlc/Cp/O8giKgRoe9A8kFN17/oSfsGey3
H3YlwiPbccndSS5PxHDKWrbaT+em0kPRpEmtzvH2HgetTrmAxKPPKjmx9yhDHKWd
/Pc2TWkjD+JntRdBVKkUro7SvLBJzv2mxv1eRhcEjxV9hlO0wCs=
=mlvH
-----END PGP SIGNATURE-----

--alsyczz6sdv6nhdw--

