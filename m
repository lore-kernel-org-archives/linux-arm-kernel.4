Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tCT6wxYK;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Z/fjWoYP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=H7KUPIMQTQxlieuvSYIhpe8VSF9yrzbbI9C5IKtg8XE=; b=tCT6wxYKItE9uS
	SizpVrsogQKx/qI6PyrsUBh2adL7NXZwHgJZvq9j5z6HnvySeA7nhbnt6kXpT2XXLFMLVH/P/NuwF
	SmGKo5RRKVv+ZRRV7R0CSvcIjX2FJDw9PkLlKUF23pSO+J8Kooh0sil47omSmnQkcTMQVdpzOPrb6
	0w41akZnu8WPDKLJQVSMAP1FR8ccJo1WBj90Jc7U+TdIKn3ahRHfXqraYg6KqGDbM4mBtLn3fyFEi
	fZKpEzeA+Gv7A3/QKJ4y2iDJGk+EPi3tpfOg2II1/DIe/VJFqcJn+p/yM+QXibKKgHv7ybLg0JSD/
	7Pf3iSvk1xPMWYlVLqVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZeV-0000000DOTQ-21Ky;
	Thu, 26 Nov 2026 13:36:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZeR-0000000DORR-04oU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:36:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83757C2B9CF;
	Thu, 26 Nov 2026 13:36:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28BAF604ED;
	Thu, 26 Nov 2026 13:36:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B2CF111E68014;
	Thu, 26 Nov 2026 14:36:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795700188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H7KUPIMQTQxlieuvSYIhpe8VSF9yrzbbI9C5IKtg8XE=;
	b=Z/fjWoYP2LAGa6bLi7P4Z6A4oK6uLAlsKjy48jTevgNt+gcBdaiS/FKo+vhiGy+hKVEc7P
	hsoWpo8RFP+x+WsvWrwlEAcZmGZJ2Nu0iy3cdui/YjiibfHWSVQpVaws1OB/jgY/0OPcU6
	wm2/OajYv86qWJIRnX0A8+9k9ToLwDtnSUVXQBigX3zX/Jv6NmiRhvCPn1e0/5OJ1JmONI
	GEHs51lEiQJDhUA9RsvuY2YXr/OTwCdzIt3v3CUwy4SZ+BEGLiwGUOYHZBP8mTXDVcdiZT
	u8TpQSKG38lCq1gopF2sTB71m3HQFLu6lYP8Vqmzrn7Qqsf2NewQu6a/xRxpOg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:36:23 +0100
Message-Id: <DN56L7R8OJ70.3FZ8Y1LD57SO@bootlin.com>
Cc: "Ulf Hansson" <ulfh@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>, "Shawn Lin"
 <shawn.lin@rock-chips.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <linux-pm@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ulf Hansson" <ulf.hansson@oss.qualcomm.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: Re: [PATCH] pmdomain: rockchip: fix warning when deferring probe
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261122-rockchip-pm-defer-v1-1-5b41635e3410@bootlin.com>
 <CAPx+jO8+WAK+W8BVOSJVHoLEvQUUr0-d7gEEK+yNwhJH5skYUw@mail.gmail.com>
In-Reply-To: <CAPx+jO8+WAK+W8BVOSJVHoLEvQUUr0-d7gEEK+yNwhJH5skYUw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_053639_201811_916B0DD9 
X-CRM114-Status: GOOD (  12.54  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ulf,

On Thu Nov 26, 2026 at 1:43 PM CET, Ulf Hansson wrote:
> On Sun, Nov 22, 2026 at 2:38=E2=80=AFPM Alexis Lothor=C3=A9
> <alexis.lothore@bootlin.com> wrote:

[...]

>> Fixes: d8b384777066 ("pmdomain: rockchip: fix clock leak on domain probe=
 failure")
>> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>
> I have already queued a patch for this at my fixes branch:
> c671660ea0af pmdomain: rockchip: Only put clocks that have been
> successfully obtained
>
> If that isn't sufficient, please re-spin the $subject patch.

I've searched lore before posting my patch, but not well enough
apparently ;) Sorry for the noise then.

Alexis


>
> Kind regards
> Uffe
>
>> ---
>>  drivers/pmdomain/rockchip/pm-domains.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/r=
ockchip/pm-domains.c
>> index e193f978d5f3..adc3bebcd928 100644
>> --- a/drivers/pmdomain/rockchip/pm-domains.c
>> +++ b/drivers/pmdomain/rockchip/pm-domains.c
>> @@ -854,6 +854,7 @@ static int rockchip_pm_add_one_domain(struct rockchi=
p_pmu *pmu,
>>                         dev_err(pmu->dev,
>>                                 "%pOFn: failed to get clk at index %d: %=
d\n",
>>                                 node, i, error);
>> +                       pd->num_clks =3D i;
>>                         goto err_put_clocks;
>>                 }
>>         }
>>
>> ---
>> base-commit: 988117cc1bb17338c586a4e21ade88b5397eac33
>> change-id: 20261122-rockchip-pm-defer-adb33313f110
>>
>> Best regards,
>> --
>> Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>>





--=20
Alexis Lothor=C3=A9, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


