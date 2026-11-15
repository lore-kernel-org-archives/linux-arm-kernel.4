Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3679E606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 06:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uZaVDUhe;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RIIPT8Lc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ogT/koYnptNR6Kgjq6wLsvdMw/b7dTQfwDW9ZNvLnhY=; b=uZaVDUhea9KHg0xVY9RrKR+gms
	VNvmFhFWHrR0dRIAHKPyQFrUVWKQbW82tZ0i+lQ5FrEObxjzJcz+ItjGSGcTpFTd/BGnhZ8nlK7LB
	q9Esjj4WeV4Uf5Irkwa1fhf+oydZNnuegDBrNV5PFV7v2KtzUnPbtuwPwbz9Y153k6w2lwfpMOltl
	HUNa4xVnl+UXWzL1YYNQKU+quviTjIlJY22WMX4I2axIbaUYVDJcJZL+prDTHLeCBuDRe0Yp0jw7M
	SuO7cgaMxZwKwQCeN7vsOb/HMYnJxKAEyDWfotsrd1epSVffuK4l+yOSD29HsOeCvZvs4e0icII/T
	nE3YLECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpoA-00000001CsF-1FOc;
	Mon, 16 Nov 2026 06:03:14 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpo3-00000001Cox-2Vw9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 06:03:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794808971; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rs+3oELz3PROgS5wZoqZ51BnRg6NpI/g+yYUp5PT5KDVY+XUt3gsHt88aE/r/8rnSbQ5IkptRbS0sPLY3dh/llRzfZ5MS5eVwPfPgO/t1IxFwaZrsiAZPTCcMd+VwIAV2VWc82LuHr8QBkTYA+c35UGuMBwVzizaj+HNS6e+8iQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794808971; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ogT/koYnptNR6Kgjq6wLsvdMw/b7dTQfwDW9ZNvLnhY=; 
	b=DrO7wrN1N95n460j7GE9PGMqz7Ge1BOze2Sbo5WIoqjKe48Kfu1tAGbRnJUXFpC9/MT+O/ESDZCiMaNuSBmuuWUHHwDLzIwyPW5YsAyUThyCG4nJymts6mv9KSvBR8E2UlLMn+crNoGPBKaTYL94ZxT0PkkvcJH+fgAxa2a7qgA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=RIIPT8LcMNhzbj76dYxqP/YQc0phhKlWYdt+/lCVmlfCavYlPeFgSK7rW1zwzGMnKTG/ZUTI7hGBJV27dIO0WBkfaumUgnQiy8dRNY6MmG5YoN1j+OvT3/5KpzAVm7IogUvVnLLq09CzVytVB2wco2rc88kaU5rep6wshznu2QU=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=ogT/koYnptNR6Kgjq6wLsvdMw/b7dTQfwDW9ZNvLnhY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794808969592150.2975159085987;
	Sun, 15 Nov 2026 22:02:49 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 5213E1817E8; Mon, 16 Nov 2026 00:14:34 +0100 (CET)
Date: Mon, 16 Nov 2026 00:14:34 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christian Loehle <christian.loehle@arm.com>, Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Andy Yan <andyshrk@163.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Andre Draszik <andre.draszik@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Song Xue <quic_songxue@quicinc.com>
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI
 resets
Message-ID: <avo8wrWBjsk0RU6s@venus>
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
 <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bkecdtnjrzz7cqsu"
Content-Disposition: inline
In-Reply-To: <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_220307_707805_C6C2208F 
X-CRM114-Status: GOOD (  29.13  )
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--bkecdtnjrzz7cqsu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI
 resets
MIME-Version: 1.0

Hi,

On Mon, Nov 09, 2026 at 04:47:29PM +0100, Ulf Hansson wrote:
> On Thu, Oct 29, 2026 at 10:01=E2=80=AFAM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
> >
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
> >
> > The PSCI system reset calls takes two arguments: reset_type and cookie.
> > It defines predefined reset types, such as warm and cold reset, and
> > vendor-specific reset types which are SoC vendor specific. To support
> > these requirements, the reboot-mode framework is enhanced in two key
> > ways:
> > 1. Support upto three 32 bit magic values as arguments. This enables to
> > support for a 32 bit reset_type and a 64 bit cookie).
> > 2. Predefined modes: Add support for predefined reboot modes in the
> > framework.
> >
> > With these enhancements, the patch series enables:
> >  - Arch Warm reset and system reset cold as predefined reboot modes.
> >  - Vendor-specific resets, configurable via the SoC-specific device tre=
e.
> >
> > Together, these changes allow userspace to trigger all above PSCI resets
> > from userspace.
> >
> > Note on introducing psci aux devices:
> > Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> > uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> > psci-reboot-mode probed through a common PSCI aux device enumerator.
> > Reference discussions on this:
> > https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQ=
X_eHt++A@mail.gmail.com/
> >
> > ---
> > The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> > qcs615-ride.
> >
> > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> >
> > Changes in v27:
> > - Removed unnecessary headers from psci-reboot-mode - By Bart
> > - Rebased onto current linux-next.
> > - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2=
-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com
>=20
> Overall this looks reasonable to me, but I will take a closer look in
> the next few days.
>=20
> When it comes to the merging strategy, it seems like the best way
> would be to funnel this via my pmdomain tree. But I need an ack from
> the relevant maintainers to make sure there are no issues with that.

Works for me.

Greetings,

-- Sebastian

--bkecdtnjrzz7cqsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmr6PNkACgkQ2O7X88g7
+pp4WA//ScXkYjx2fyM5OuWtXOCXNPFqaymVSzMvBWj7t8a1tDehexmNzDJtGzRz
AieJj5S96zfsnsOK47xrjJHmWXO7M40VzV+USpbOciHqLhelLgLrgNTAkR/qR3g5
8bdEOdqCuD5x6XMbVzY7qB0WfB3sF3Az5Z6xUWnjU+rKTNDKIprR4G7zO5F6G1Of
UJ/+I/uqe82uiOwTP0F6EOeIPbeUqZAFvFUP6XdZqfNIo0cdPLIKLWdlVnsC7b2X
94EwxTDD8PLe9PzZ7KWO8Kta0jwsQSWUKIzIVdJIdQyVcEtpxxOXZEZOeEyZksN5
B0xu4PZcm/AO3SutpvabV9E4813c387zVv1UECcGen5x6o4KdM97+Z99Qi4WOJJd
y4fTsERdlqO62MeP9BUZhK+bSzBx2DPl4an7w/iT6rj17bQps8/zAk0ZHadadEfi
z9E5Np4Syj07oHi/GZkO013QDi8oYcl1/aiKJb+gOrA3oU4WryQl2oXwR9av951p
0sF5lMKT3cCA0VPl6UgNgOMC+njJfhlk91vNI4NX6EMVk++gS2nq1PgBNdw6bLd9
GrlVoSbbn0kYYDO12rTLuhZN5mgSRHG2sAC/Qzi+RivK0cal4lA0hwphm/PwD0db
6WeTDjaLmbUFs6oYvajVbcdcbCOGt2T2yJugnQsGo2Y7OA/affw=
=Ooso
-----END PGP SIGNATURE-----

--bkecdtnjrzz7cqsu--

