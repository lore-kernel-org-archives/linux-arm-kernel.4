Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5079606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oi4UqrQe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pLXUjdyr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=; b=oi4UqrQe5kUd0+
	DmRU5NnQZdRKSiICMsoFUHVFb7MunkQRKc/rHaNsR3N2j7P89IVKd5MQNSsh4HS7r05kMxOZMZ9PM
	twrTJvg46kqGx/7cR4C9O33RsQBn+j2nELMvY4gTqKFKfw6FTEmX/dbv73tCHJNpVnmpXEgp0noYj
	d1h7h14aIyf+cYth+rSJsVGKcIbCCV4/+fSMqrY5fVIVnT+Iagz5HlGedOcgNFLQUmSXWoK/bxfcJ
	FlhJ2GtiFGUOo4NscFAgGZYtIoTFarV2QXmnUE69THi4AoXJmMTU6Wz0ff7YzV75cUT8gDiyQJCOG
	r/aj/VFMIIDeMttYVKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoRt-00000004UU1-2Nrw;
	Tue, 10 Nov 2026 16:11:53 +0000
Received: from mail-ej2-x09.google.com ([2a00:1450:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoRr-00000004UTC-245R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:11:52 +0000
Received: by mail-ej2-x09.google.com with SMTP id a640c23a62f3a-c504b4f2b6dso42020466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794327109; cv=none;
        d=google.com; s=arc-20260327;
        b=S5Bf8yl33/EsfPfcAkSkqmQU0TbSxvk+1HbcW9JVI6FQDobKUJ/hTh3TjJjhH/fccE
         a3XdrQlLBbgGIlnZIXJNR8F8x8hCls9WTlRoXmjGnx2HhplsE29W5HBl8ffcDfZt3Lqc
         1F4gNx5nb2QBh/qhm2wZuPBFHSvmC6o9Cw8zk7rlP5rYDpi44WdW9KDdcG9APlCHJRmZ
         8hIeSQEGJ/K71CjsWmlDJnGY30gWb8qrVX1LGGoDo3wPO6CwAmDgVnFGSTmjTd0C6mHH
         Ao79bWxafkioS69p21eCDX3fwMPwOLJqcdr5TsaYEFtd5+jy64sOuMFSO4Hv81KLheX4
         ZPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        fh=mD5U1BIjJN9JBKCUTW8tSQeoxJop4R5yCOipSAB8OVU=;
        b=i2xTNt2BiDTzMP+/VNGyI2+4JLmtFT+UWJO3v5Tef7MSr8nTzajCxHKnqPo4JAqhl+
         xDWSp1IoC66PU6AgH2HVSARugz3EUpFe01J3k7Cfl6V+VtWM/tqRCNCOsT6Bxu9x8kiB
         QZDqhMt5WD6wcrDxl7OjNwUeWrGbsTxz/wC85NF9yv8xnbw3IO5QTbu5DDNHJWsaGVg2
         jpjRgtuvtFaPLqP6PL/dDaz698eNYdqiys5MSIaQxwujrdCv83LL0UY90F4JFa1kc9Vw
         wd0Fk1B73racBz1Otx25pd2Xzqb2BWdDSNNZ04JjMDwWG14p+8Cx/WSxitUVHXBxhWse
         2PPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327109; x=1794931909; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=pLXUjdyrLWBEOqTha9DT5DqgD4SoJZe980qSASshUBRne4Ez8b5d71pTSQQjf1zcQ0
         PWohAfmO52Xm0Fu3GM/4iC3svlG8AarprQwezpetXOyX1TLL2vAPZt1Jg1GxLiEwaLwh
         mSQ+xOkLfMfiboUqjq2cnsMXgUb3QGC6ayFlEAi0F8KFM1mD+/iTQCgaGJhBRbfT3N0o
         wRwHMoX4m4maDwtFvM2PQ18S5i0mVxnZhmJ0/Eg3fUDvXg2rrWQELo79Eub2w7/p22cV
         lC4hFXTCI24lZ2JrBe2fTLsHf5pwBJSf5B4oiqt2vS0ZZBMnYqXS7aMY66Pq3y2gGNWk
         QUBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327109; x=1794931909;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bvu8fH1m1BZ2sQQoPyfnhre5VWvJqEOu2Sa0mYvTTis=;
        b=h0kN14gFHAeFnGIISlKUZTEo2puO4DNzkIIBvPJcWVaixD3FfGd3hrieODYOI8zeIo
         rnBKm3Hs/oo+HhgGzgfIOm0RNMRprX91jomSA3DB+r/+QEeY+il76uoMJ8Hb3kxabUFA
         mxFBIGwRiSgMvvmIE14oacJ+4LiOD3NzM6s3JEG/BiUMOWK0WirVLu9RmMh9S1XX6deY
         FzERGzCUlDfXi4cXRsGMrTqwfCY7x0iRIiXH5+trpZQIzjC6MOXn4nWUBY74wPb53kKU
         b/oqNhkhayJp51KZ4R4FAxL01YqF+IfPW0fsudqOTKEA7kSW5wiUMPLvQqPhGF74pVp7
         wGMA==
X-Forwarded-Encrypted: i=1; AL+hErEkquR80J/sqZEJ+6ukwHnLnwuoas2DPvuzXhRZVAQyjjLwTyJnV18rM+hRjLxNHSgJJ9VKbnJvGB0B6g7YqkO6@lists.infradead.org
X-Gm-Message-State: APuU4Z/pbo0c8tmjSr2iawcia/VNmtKsdv76WeAngMyXmlexL6eN7DAc
	TmBGZ9G/EsbvGyeXfUWWwA1Z6am4laRMkSMaLA0hjXlWQGEEHWuyYlb2kPVaS0Chzpq3e+RcPUi
	XhJiPjqexkQc5AfTfpYbUQhw4kKgtew8=
X-Gm-Gg: AYBFou0E7V+Yfmdpi/yxyJlYn3/c5o01QLxlCL5FabcGB1ryzeMVkOiTQm6U60E1ti4
	plk/p77NlN+a0Jzw6j28bJI1MgLb7m5rB1QnctiAtTWrV/imFfpLPlpNXTaOSw+OfCrmip8GYV2
	upFaZT0ZYfOI4st0zFite8OmiEkPZZLzMqTRfGjdhZu9Py56Rky8wKqMeQaBGMZ7nveiuLr5RB6
	esVMw1kRs2mbcKem+8ATMaOmE4IDZDq/LoKP+x/qJPx7gzemJxJKBxd9QL+tCiUXDrTk4cUE40y
	xrki41DeQrcfp70zG8/ZBqm/OXhncPPs6fYSTWCYgw18d78Ob3KypPO6xkCp/wqRi9tB/jaEBZ2
	r8U/CDvbaqPV9sI5voiQTlX84ktek0+FWMhNd1DRW6nqTTnFGwB4=
X-Received: by 2002:a17:906:194a:b0:c41:266:68a7 with SMTP id
 a640c23a62f3a-c504952c255mr192385866b.10.1794327109186; Tue, 10 Nov 2026
 08:11:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CALj3r0ijsuzadYoi0NPkSpT8smRyi607APfxLS8_u3JSH3+dPg@mail.gmail.com>
 <20261106115040.1199269-1-amadeus@jmu.edu.cn>
In-Reply-To: <20261106115040.1199269-1-amadeus@jmu.edu.cn>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 11 Nov 2026 00:11:35 +0800
X-Gm-Features: AclHuK-W_aGhTciJcK2jT1mQzUOxx8a9MsoP2BEfAZfP7jfpZyRRqnBuAfsnq9g
Message-ID: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on
 Photonicat in battery mode
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: bigfoot@classfun.cn, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	heiko@sntech.de, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_081151_551701_C360AB11 
X-CRM114-Status: GOOD (  18.84  )
X-Spam-Score: 0.4 (/)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Chukun Pan <amadeus@jmu.edu.cn> =E4=BA=8E2026=E5=B9=B411=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=BA=94 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> >    (5V_BOOST and 5V_OUT). Adding a `vcc` prefix would break the 1:1
> >    mapping between the DTS and the schematic, making it harder for
> >    anyone tracing the board power.
>
> I didn't mean to change the nodename, but rather aliases.
> BTW nodes should be sorted by nodename (placed at the top).
>
> >  ... However, 5V_OUT
> >  is a distinct net in the schematic. Keeping the node makes the DT
> >  power tree accurately reflect the hardware and clearly documents
> >  that both the USB VBUS and HDMI 5V domains share this OR-ed source.
>
> It is not an independent network. 5V_BOOST and 5V_OUT are on the same
> VOUT, only separated by a diode. The device tree describes the hardware.
> 5V_OUT is not a regulator, it has no enable control, so treating it as
> a standalone regulator is incorrect.
>
> >  ...  For now, chaining
> >    `vcc5v0_usb30_otg0` -> `5v_out` -> `5v_boost` is the most accurate
> >    representation.
>
> Adding a fake regulator is just a waste of startup time.

Hi,

Thanks for the feedback.

I understand your concern regarding 5V_OUT not being a standalone
physical regulator. However, I'd prefer to keep the node for two
reasons:

1. Consistency: The DTS already models other always-on fixed rails
   without any enable control (e.g., vccin_5v, vcc_sysin, vcc_syson).
   Keeping 5v_out is consistent with this established pattern in the
   same file.

2. Accuracy to the schematic: 5V_OUT is a distinct net where the
   external DC input and the boost output are OR-ed together. Keeping
   this node makes the DT power tree a 1:1 mapping to the hardware
   schematic, clearly documenting that both USB VBUS and HDMI 5V share
   this OR-ed source.

Regarding the startup time, a fixed-regulator without GPIO or clock
controls does no hardware I/O during probe, so the overhead is
negligible.

On the node ordering: the node is named `regulator-5v-boost` (starting
with 'r'), so it is correctly sorted after `battery` and `chosen`.

Coia

