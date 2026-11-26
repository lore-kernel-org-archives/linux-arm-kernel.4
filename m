Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC75F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k9+9BpLD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ps6ry37b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=; b=k9+9BpLD2aK+hb
	1dxKNx/6DyAA0nzu/f/uiKZjvfXuSzT2dWD5sSQeU7DgagaxVTGpASth4g8Bsp6mEg/V0kVe3DbSq
	El790w6QKxCleZVteWnXmsoCF/OK8iYRkTdcwftYU6bb1cjCVXc8TqF6bxK6qnOFXGxxWqZja1tg+
	nF9AVrfoTSH9tD/kWSQFzbugCON7MFTxcrhBBEYAB4fC3NaZjHeqiZhHVezr8agwFPYZ03BYxTGZt
	T+rjwloh/8vmJExIXkRpizw06XfTmZANaPeFejG2+iyVIJwhm6Ynxp2+1cFgEYvWtEu8aXWNwvxMn
	1iQyC+5UpmOaZx3sT3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbk5-0000000DnXS-3W7f;
	Thu, 26 Nov 2026 15:50:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbk3-0000000DnWm-0FnM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:50:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso3020967a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 07:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795708234; x=1796313034; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=;
        b=Ps6ry37b0FF2Lew/MDIQF6OTTBW0I54LB7O8bghSnj35VTr9Y7Fmucya13ae0kMg6o
         Lrca6rMaEkYL2+SFKXMvOCYxGaZ3hjcFm6XgOL44US7k1Vf5IzAoxlV+TfPPv/Lmf25b
         4i/eNSNZGRSn9rJ6f7eEQd3+dCfpLcJ4vzlRXEJToWIKUY/yKbLVDzm3Q6wA+Tu6iZSE
         coiZ+RxJ3xvDoJ7d4uKgiTo4hkfLVQyz3YUvYF86fgmtWR8O8wva5rVjKxZY9JdzBkHe
         9Pti2+rW8PVPZkv7np7TMcP9p8XwilH82eesjjvkT9EOxb1RPNXZzArsgo/yvDEwk3O2
         071Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708234; x=1796313034;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9tdjEIQaLeIKemcpORMMBN56iw/fTBfPHbyjb2Sajo=;
        b=PeVMRpIB/nMtXVInzm+qGGs8axCZYLS0QjMdOV2JRr1o/ob+f92Xi8LtmWmJZ6If9Y
         6isxfvOoIKnbZcUGgP+q7UKwnCvLW+IAKCKm6PV4V8p6TtUMSpH7911pxf1eMXWJWxTY
         dbTbFQjpuT5EVRb4VvGTq3iXfaUIphmEiR303JXy/LyTHP6WWiTgQQ/txDVMVcO5uwa8
         ppyT805sYTd/CfX6/naFN9+OxhcKDgEoSYononVdvW5PAsA0fFJZhJmF6TliPtVeBG97
         wRpjtFOvPgdgNKxo5dCXsnPz0cFi94O/mcvhP2YHxb93WnmuY8ISUPQJUB+rd8IJuXpI
         r/jA==
X-Forwarded-Encrypted: i=1; AL+hErHfLBc5IDzsY0dLvbQxzDPQlIvbvqfm0ZTKXMSp8YBNyhbgsVmnnOThYIE3e9S4RD2MPdHMjfTAJV2ylhq/fZ9x@lists.infradead.org
X-Gm-Message-State: APuU4Z/PRXHX6oSo2hHu552kS34FbwVYZoOZ4avDBU826JVVPE4m6Vsh
	WG/d6iKjo4ImgdH55oFXPzXlQDnUn4Jgiuv7f5ItfWD6qDPff8DaV58=
X-Gm-Gg: AZFdTZfJuFoj9fAR7XxXgX4ooyt/5mdHk533tJKODp590ov/li+BZA3q0rsMVZmBSzk
	EGBFpJ56pR4kIto33vJJ4tFWHzgyKjPv7jFiG4OMw5vbMsjnXzbrjizRIj0XGkqhh5oFEtMfpx7
	aBI3yA06zigDV3F3ME8H170sIUzv67uDLKwIXnZo0EwniKJlnrNgiN9uM5jO+7mPDsBOtdtIhSf
	i6EUzQwZp79zB24fmbBejS3AnqJ4ELFa2knFec5g/8ulvUWC67G5MqsXqT4chUjMDsDu6cpB1cp
	MU8YGbcWIn5uLn62Db5CoEnV33wGePK9mpEH7Tufpk/UlhvY934w9JXpi1YFfUrW78E9FT+PgqM
	EVzkQhw/pJ1nJlSOcUFcmV9i1oRbOXZl+q4/nrTLPs6MazOJNJ40u18m5I2Kkn8VdefDn+Oqq3Q
	9UrhsNGiUVWELrq1Z0k7fw8qldnO2Aqsub55sZjShOtq5O56ZL3xXMc5MoiRKTw2gXeTriETu4A
	ifEU4xqaJOEAiTAt57Fj87+2ze95M5QOjLM4kyOF4kCVUTouyBtZ56OfP6LG6yDOB8WnIaEXB/L
	HjpatsZOd/aJx3Pq78HNPxiyMWmzG+iBjbPf4lUxjq51ghxiSa5yRQ6snbeJ
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id 98e67ed59e1d1-3b41c95aec8mr19342674a91.46.1795708234058;
        Thu, 26 Nov 2026 07:50:34 -0800 (PST)
Received: from smtpclient.apple ([2406:3003:2002:639c:a06e:23f:85ed:4cfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm32889076a91.3.2026.11.26.07.50.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:50:33 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH] coresight: tpdm: Fix fwnode reference leak on probe
 failure
From: Yige Jiang <yigejiang86@gmail.com>
In-Reply-To: <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
Date: Thu, 26 Nov 2026 23:50:19 +0800
Cc: Leo Yan <leo.yan@arm.com>,
 Mike Leach <mike.leach@arm.com>,
 coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C23139C6-D52F-4A67-A7BE-4CE55250B9E8@gmail.com>
References: <rc-b1-20261110-vc-178-2d9055f946c8@gmail.com>
 <e06bd559-c8c5-4e82-8951-9f7894cfb378@linaro.org>
To: James Clark <james.clark@linaro.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_075035_104523_FB68B4BD 
X-CRM114-Status: GOOD (  25.06  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Thanks for pointing these out. I checked all the callers of =
coresight_get_platform_data() and found the same issue in _tnoc_probe() =
and tpda_probe(). I'll send a v2 with one patch each for TPDM, TNOC and =
TPDA.

I agree that relying on the order of operations in each probe function =
is fragile. We're developing a static analysis tool that tracks refcount =
across driver callbacks to help catch imbalances like this one. And I'm =
glad to hear Leo is reworking the locking and connection handling in =
CoreSight.

Thanks,
Yige

> On Nov 26, 2026, at 10:18=E2=80=AFPM, James Clark =
<james.clark@linaro.org> wrote:
>=20
>=20
>=20
> On 26/11/2026 13:29, Yige Jiang wrote:
>> coresight_get_platform_data() takes a reference on the fwnode of each
>> output connection's destination. These references are not devres
>> managed; the core drops them in coresight_release_platform_data(),
>=20
>=20
> Don't _tnoc_probe(), tpda_probe() and smb_register_sink() have the =
same problem? We should fix all of these at the same time if you'd like =
to send a V2 with a patch for each driver.
>=20
> It's quite fragile to have to call this in a certain order in every =
probe function though. Doesn't seem like it will survive further changes =
or refactoring for very long. Longer term, Leo is working on refactoring =
the locking and connections. Maybe can do something like make =
coresight_fixup_orphan_conns() re-read the firmware for unconnected =
ports and re-connect them, rather keeping these long lived references to =
fwnodes.
>=20
>> called by coresight_register() on failure and by =
coresight_unregister().
>> tpdm_probe() gets the platform data first and then returns directly
>> when the drvdata allocation, the MMIO mapping, the dataset setup or =
the
>> device name allocation fails, so these references are leaked. The =
nodes
>> come from the base DT, so this only leaves their refcounts unbalanced
>> unless they are dynamically allocated.
>> Get the platform data just before coresight_register(), after the =
other
>> steps that can fail, as the funnel, replicator and TMC drivers =
already
>> do. Nothing before that point uses it.
>> Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
>> Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
>> ---
>> Based on linux-next next-20261109 (630059a5a632).
>> Compile-tested: arm64, GCC 14.2.0, W=3D1, CONFIG_CORESIGHT=3Dm, =
CONFIG_CORESIGHT_TPDM=3Dm, CONFIG_COMPILE_TEST=3Dy; baseline and patched =
coresight-tpdm.o, no new warnings.
>> No hardware or runtime test was performed.
>> The paths need an allocation failure, an MMIO region already claimed, =
or a dataset setup failure in tpdm_probe() after the output connections =
were parsed.
>>  drivers/hwtracing/coresight/coresight-tpdm.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c =
b/drivers/hwtracing/coresight/coresight-tpdm.c
>> index 102b8b7edf87..07e19c1a94b6 100644
>> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
>> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
>> @@ -1404,11 +1404,6 @@ static int tpdm_probe(struct device *dev, =
struct resource *res)
>>   struct coresight_desc desc =3D { 0 };
>>   int ret;
>>  - pdata =3D coresight_get_platform_data(dev);
>> - if (IS_ERR(pdata))
>> - return PTR_ERR(pdata);
>> - dev->platform_data =3D pdata;
>> -
>>   /* driver data*/
>>   drvdata =3D devm_kzalloc_obj(dev, *drvdata);
>>   if (!drvdata)
>> @@ -1444,6 +1439,12 @@ static int tpdm_probe(struct device *dev, =
struct resource *res)
>>   desc.name =3D coresight_alloc_device_name("tpdm", dev);
>>   if (!desc.name)
>>   return -ENOMEM;
>> +
>> + pdata =3D coresight_get_platform_data(dev);
>> + if (IS_ERR(pdata))
>> + return PTR_ERR(pdata);
>> + dev->platform_data =3D pdata;
>> +
>>   desc.type =3D CORESIGHT_DEV_TYPE_SOURCE;
>>   desc.subtype.source_subtype =3D CORESIGHT_DEV_SUBTYPE_SOURCE_TPDM;
>>   desc.ops =3D &tpdm_cs_ops;
>> base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47


