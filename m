Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A3606A83D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xZKt3bF5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=tmPbMymg;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=qrob+Jmo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=; b=xZKt3bF5rYVugP
	cvwMqAbQkjmdLpbAIre6JLrxzPghPi51N2XOVqnWkXDqVjM1hh/gkrs+URqoLcyATkx4ERX9IA8qj
	pqutWNfQbHqUI8V4PmQtlkhAIfmLwvIh3znguuQeXN4fK7hkmheB6CcyHJRNNB2vj8wgzHcgPuhLs
	1V7Tsa4q2285pfAO7C9IjOQs8hVZz28V6K1kYohie2WtAwlXEzpQl4QaHH9iBC+BXpYEFAYlb7bkE
	PcwRZi7uSuXLYOvHpSmPni4JsohCnC5b8xkjFN01HGMB598bgCXR6tgWeyxPnvgaOi8uxZtm9NTAX
	r7va0dZ19GATnI0jlhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpBd-00000004c3x-3qyD;
	Tue, 10 Nov 2026 16:59:09 +0000
Received: from delivery.antispam.mailspamprotection.com ([185.56.87.10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpBb-00000004c2z-0Rho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:59:08 +0000
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794329947;
	 b=V0IYtoHgt9DbM9nPn57PtHnkWzDMFECjG1xxyhrCovvN0pDxVGuFgvsrYELFkfWxtteNSCzCd/
	  AGI7tv3wQki4590zijtnAWSxDV2Y7CB0qMZJNmhAPgFjYwAOb9ft+FRbJQC8uwiaH3A/qBq2VD
	  d/lbR1Rv78KWokKNLjBp2PTT/8XX7TiARQITN2Uqf9F6bYn1Zd7NIMuqwtWse1/ib3vodnfx97
	  yldcBcRAyTtzrGPyuNKA4WrVSFH+3ZNTcphowHTT2iij5YWRHy/YiaPzVF9Y82+0i5GYaBvmdS
	  Q4WF8o4Tf+mb/6VEO8nKOcx0QISKu3cfZXa2OuUfEtwkNA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794329947;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	  In-Reply-To:Message-ID:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=iTU8Uu3OuzSWFyLebCLMmoLpepXmOF/4AcapS2fw68CdgzzuIuTDG5qBG0+lB+2hBp3PNfehK5
	  g2DM97xztq6CEB2zSeTv4ZEmJf0AmmBq/PfHlhtotUDltpb8eZ3R/ynRM6SSbHU0C7XqGjWTz+
	  FDLWmNNjPGLJxOGec22odRX25lvulcOecJ7uXAxeVaQAPTFIXHABM6LpO/sIpO35tG/ob6l3nk
	  IXnBtFR/SWIq5JHa700VM+nTOFlWW6jzJwFvOvMjzCYAqXn0Bsodf8nk+0Gi8R2VxGbAz0EtU1
	  kf1MbLv0IDuVHg13KE9rjrUhPYggTHilmI/yU9e606Tgmw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=; b=tmPbMymgrY3NG2cjy7Jem1ehN1
	3JwrpMI1i8UwA8LQfmqDAIWN8SACuBWSYb+UAxbfRxvgsPziqTRXNicffrhGHJxS3WxSsL9wV2yFB
	AhsFdsRTG89x+u/WgdlpA8PYMx/QjSIvOkDeOXpjPMeIVa2lsy8QqHOtsxK7uOAcC4S8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQpBU-0000000BuHB-26E9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=; b=qrob+JmocH4xrMNATvmA7uR9iO
	PFT1HYk++mL+WoYIIKR/e1076P3KQDF0HyphTZqavIj/MZiTDl7fLT4v5NYbph2DKjeLtI9AVWch+
	GWsJlSro+N+mTPVWO2CP27m63QfdVhPy9xUI1HQPEKESYGlj/IUo+7h4mZNOJ20saiKA=;
Received: from [109.54.113.250] (port=16151 helo=dummy.faircode.eu)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQpB8-000000007rc-1PpM;
	Tue, 10 Nov 2026 16:58:38 +0000
Date: Tue, 10 Nov 2026 17:58:35 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Message-ID: <cea97670-facd-48b0-97c3-651ca9d71c75@valla.it>
In-Reply-To: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it> <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it> <avM8OYHxB4nAKCnb@p14s>
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <cea97670-facd-48b0-97c3-651ca9d71c75@valla.it>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 59a9232175175cbd16efd587f3e56faa
X-AntiAbuse: ID - 59a9232175175cbd16efd587f3e56faa
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQpBU-0000000BuHB-26E9-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_085907_313999_A0ECDB30 
X-CRM114-Status: GOOD (  18.27  )
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

Hi Mathieu,

10 Nov 2026 16:46:09 Mathieu Poirier <mathieu.poirier@linaro.org>:

> Hi,
>
> I started reviewing this set, making it to this patch.=C2=A0 I will conti=
nue tomorrow
> but due to the KVM forum later this week, I may not finish before next we=
ek.

Take your time, I'm in no rush to have this merged.

> That said, I applied the first 2 patches so no need to include them in th=
e next
> revision.

Ok!

>
> Thanks,
> Mathieu
>

Thank you!

Regards,
Francesco

> On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
>> There is currently no way to report the VIRTIO_F_VERSION_1 using the
>> resource table alone, as the per-vdev feature array is limited to 32
>> bits.
>>
>> Considering that the VIRTIO 1.0 specification is now ~10 years old,
>> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
>> are not specific for remoteproc usage. These latter, which as of today
>> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
>> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
>> communication (e.g., the configuration space is assumed to be
>> little-endian rather than follow the device's endianness).
>>
>> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
>> error in case of features that would overflow the 32 bits limit.
>>
>> Signed-off-by: Francesco Valla <francesco@valla.it>
>> ---
>> drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>> 1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc=
/remoteproc_virtio.c
>> index c56d3330adfe..f1b362158a9c 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -16,6 +16,7 @@
>> #include <linux/of_reserved_mem.h>
>> #include <linux/platform_device.h>
>> #include <linux/remoteproc.h>
>> +#include <linux/rsc_table.h>
>> #include <linux/virtio.h>
>> #include <linux/virtio_config.h>
>> #include <linux/virtio_ids.h>
>> @@ -27,6 +28,11 @@
>>
>> #include "remoteproc_internal.h"
>>
>> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rs=
c)
>> +{
>> +=C2=A0=C2=A0 return (rsc->id =3D=3D VIRTIO_ID_RPMSG || rsc->id =3D=3D V=
IRTIO_ID_RPROC_SERIAL);
>> +}
>> +
>> static int copy_dma_range_map(struct device *to, struct device *from)
>> {
>> =C2=A0=C2=A0=C2=A0 const struct bus_dma_region *map =3D from->dma_range_=
map, *new_map, *r;
>> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct vir=
tio_device *vdev)
>> static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>> {
>> =C2=A0=C2=A0=C2=A0 struct fw_rsc_vdev *rsc =3D vdev_to_rsc(vdev);
>> +=C2=A0=C2=A0 u64 features =3D (u64)rsc->dfeatures;
>>
>> -=C2=A0=C2=A0 return rsc->dfeatures;
>> +=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0 * All non-remoteproc-specific virtio devices are ass=
umed to be
>> +=C2=A0=C2=A0=C2=A0 * compliant with virtio specifications 1.x; there is=
 no other method
>> +=C2=A0=C2=A0=C2=A0 * to transmit this capability from the remote proces=
sor to the host.
>> +=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0 if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features |=3D (1ULL << VIRTIO_F_VE=
RSION_1);
>> +
>> +=C2=A0=C2=A0 return features;
>> }
>>
>> static void rproc_transport_features(struct virtio_device *vdev)
>> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_d=
evice *vdev)
>> static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>> {
>> =C2=A0=C2=A0=C2=A0 struct fw_rsc_vdev *rsc =3D vdev_to_rsc(vdev);
>> +=C2=A0=C2=A0 u64 features;
>>
>> =C2=A0=C2=A0=C2=A0 /* Give virtio_ring a chance to accept features */
>> =C2=A0=C2=A0=C2=A0 vring_transport_features(vdev);
>> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct vi=
rtio_device *vdev)
>> =C2=A0=C2=A0=C2=A0 /* Give virtio_rproc a chance to accept features. */
>> =C2=A0=C2=A0=C2=A0 rproc_transport_features(vdev);
>>
>> -=C2=A0=C2=A0 /* Make sure we don't have any features > 32 bits! */
>> -=C2=A0=C2=A0 BUG_ON((u32)vdev->features !=3D vdev->features);
>> +=C2=A0=C2=A0 /* Make sure we don't have any features > 32 bits except t=
he expected ones. */
>> +=C2=A0=C2=A0 features =3D vdev->features;
>> +
>> +=C2=A0=C2=A0 if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features &=3D ~(1ULL << VIRTIO_F_V=
ERSION_1);
>> +
>> +=C2=A0=C2=A0 if (WARN_ON((u32)vdev->features !=3D features))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>
>> =C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0 * Remember the finalized features of our vdev, =
and provide it
>>
>> --
>> 2.56.0
>>


