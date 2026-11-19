Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S4Z7s1ra;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TGiY7gaz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=As0pSkQfRuyVRW7pQpIjiCQPFSszS7hItKK7eHAl2ZY=; b=S4Z7s1ra191Btxhev+X8fhMq68
	vdP9OhKXNgmIVxShYaZdTOTspCa35f5kOAg1cwOwoJCHKaJwQWgG2TCvsY6/0UNMVZPnw+H1gJM/a
	FMv0GtlQCwyLPWKSm6Ww0H74Xm+raBp12Y9Rd5Z8NWMjmlLUzyiSK5CcRag/45HPH7+f+uM0TXclO
	vhOftFviko9T5CvG8vzlury+m0JUMxR8wZyWStTb1PsccAy1SDve9O03PVgjSetjeF8e++LVJ9BNv
	RxoC/idNRhR8Ygy9dsmYdsy7qqZWQoEiOvqvGBRXUjaqB0D3QoulattqjXDOUGQgPhIj9VBwy8yma
	KKE/60Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Kf-0000000BqjC-1KLH;
	Thu, 19 Nov 2026 12:33:41 +0000
Received: from out-237.mta0.migadu.com ([2001:41d0:1004:224b::ed] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Kb-0000000BqiK-36fj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:33:39 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Z7HDvtgI5fJMIwpmLPbYZhshXtdnLS2aVD3lUUBYUWk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795091614; v=1; x=1795696414;
 b=TGiY7gazCxQFjLgL97BhxN/PE5ElPypG2sHIzmst8xObdi7AkyKlhdB00pi6C83V0+QOCgDo
 PxR+HFVRpjlmFRM+Tk4emj9+jwqPYTxkBQBmo/L7Do+j6dMglvrByQOrBqDgvl63bXUVS8fJMQq
 s3S/9apxXoJSRiuE3kHcurns=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3bef69361d380ae0;
	Thu, 19 Nov 2026 12:33:34 +0000
X-Mizu-Trace-ID: 3bef69361d380ae0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5680e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 04:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFN3iFO7vS27A+w5hslLwfVBUAB4zyKDEKm/o62yF0YZMRidEBT+VfQw8sfnse2jyW2tGtzrNbJ1Fq9XQ9xK0oT@lists.infradead.org
X-Gm-Message-State: APuU4Z+gckLRX5ul4Km+m6P2gb/0Ndt6z0abln+zVEwzzEZ5Wo63lXXW
	MgqTTg7AB7l0Ako0pPaPbrUObQFiZUv5hDLEVDIiNaUC/RnAJiwzAb79NU5n5XgOXpSfaiOKsdl
	Z/s7kFDrJ8wTkx6Xc7TT+s3YME0zUcxjk7egPC74W
X-Received: by 2002:a05:6512:6ce:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1b6701822mr67836e87.10.1795091612777; Thu, 19 Nov 2026
 04:33:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com> <av7Ly_iLyiOAXQUR@red-moon>
In-Reply-To: <av7Ly_iLyiOAXQUR@red-moon>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:32:56 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
X-Gm-Features: AclHuK-kHPtLBsCsAc1hYRee8NulrRKXzvQw07qjT3a5lYkuN2Xo98WRZLt3QVE
Message-ID: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043338_152642_DF8D2F3B 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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

On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
<lpieralisi@kernel.org> wrote:
[...]
>> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
[...]
>> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
>> +                                         u32 device_id)
>> +{
>> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
>
> I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
> let's explicitly say so).

With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

nit: this helper has a single caller, so could you call
__gicv5_its_device_cache_inv() directly from
gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

