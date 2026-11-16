Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11257606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8tvte/o;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoouNWRV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b7EBers5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=; b=d8tvte/oiJZtA9d5TqUJ4dTpAb
	8S7tDGpeKJ9xQ+DqOdDhj3+OFx3/f2WkEdJ4UVD2bA3KQ/CrS4hSiV0Qu/jSFHNIUY1uNxE8wl4Xy
	De4SeftrntFyUnLT8jp5w0UEjNYDBzgcBqgpijHsfZcZrFSVVLbB1lP3xpfZAsQaKAuPDXsmvSV0x
	CNApFPSyz/kBxubx5Vt9Pz8wdWTCo7XTrQJFgs0x/NJl4SrIec5/vC9A273P9lWpTCAJptey4tVGP
	v00dQ+HNZ0fVFnYgxr6v0iKI6HQvfmgX08xITGSg1O4blpHeznD6GCu5wwRYClVQS3DleHsdFjmY0
	YNMhXmcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1UY-00000003ZhX-3gQL;
	Mon, 16 Nov 2026 18:31:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1UO-00000003Zaw-3VOP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:31:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIC7w1110310
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:31:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=; b=OoouNWRVwYvFJHY8
	xKkLpkaRFnZGOv3pDB++UbxKh26RO7LHJs4QS8RnUwSKKj1U5sDDs+oaSOXphQJE
	J8Ti8eszqxtdJei967qryzvHOS7jCh2wFzTIK/OSsOWUslUcCyBicMe0kmQKddf6
	meW3n2h3Pjppy7izH2hcfkchz0X3OcqWmVdTkESpZiKq07+RlQtqgj37odw4oRWQ
	D07PZ/BWzFiWzr0F8GPTL4linMlDkqj1xfV/vQY5CoOZNCeSaLYpuSnaG+N5FA+A
	a2gNr5/hp7IN1bgTd3erWsP8vOm/L7ThdX0j6+2mTQve5V0rF1h4DOapCeJlzfCp
	DS9Fdg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgj028-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 18:31:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a3451ea93so3804487eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794853895; x=1795458695; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=;
        b=b7EBers5xea/XShvYF1lxsydPt+z2f/ppoSi4Td0Rslu1UXGxt4SX7lE6v5YV3Qlt+
         V9Yj0mKYsdrX9T0mZsSW9rsVNwGs5ktizBuCXJEw7Ym2JnXwectdZWcFG8Gm4JsPms+E
         wrXhgK2TGHqlp+ohLBA2QmOoQ4+BgYzu6LTOyTTKBeuTsevx59Hq4/pu7iN37tjCtEqa
         JpXaPzmUYf47QiXGIwMtSvN2re5BWDYCt2Xg5tpUrLzrddknNdRWq5p25dLmHHjKtw/f
         /VXeCjQS0SOnFBg8IeYygpuAFHQrGtlRqFJiLmQuDj5qAoZNDxyHg3fQAY1D8klSQfvz
         q3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853895; x=1795458695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqbhyzTPwwLXTG6MM5gIEyz9kRSPoNjiNdRjVrtFI2g=;
        b=tnKT3TXQuaQo6YJbP4CwkV89Xb5aBLwf2JN2YZPuwPDss5sFpkhihdwg2Uh2VScYGj
         iOHi6fd+XnY4QYnZiGbGhqUlP6cgQ6R/9P/PpL2kj08YQYhIqwHpvnmlPgXizdixh9cl
         PBKwweaZKEmy7CfcLhSuWEGeppKn4r5e7bW4DA+aQg8F6zs18NJzzpbzmwWIjw8ZALVz
         ZOu1Yqc44FQUFALMA0tbKtPV+ASyhH0SAtCbi/kcmt1TbpJck/J+w/ofehaOyuvvbzly
         jttQeVwJ+pVwNkw9g85ocIEhDSbZP8m4ih/xTG8k4cNk8RzSFpzaccG7XZ3nsP1K7grV
         8+8w==
X-Gm-Message-State: APuU4Z/5WkcgPlmTjRCbyZ0UTMFmc38MQemeJiTYZgC2NyAdswZb5Tow
	i01YhR5YKJgodAXJQVszO2EeGc7RKhEmaHaAZQ69RzZ09ENhJ4X6lT6Ykg98KegIqt3gmzVKToh
	TW6Erz8G3zbm1fpTJNPfygeJpnVo2aRlW3JoZciJclrikFLLIqC6l2ZXR8uNvh9lD1ekrmZpaer
	itvc37KxKgKARn
X-Gm-Gg: AYBFou2GzgvidKrUqkDGTnHPOwpKb/FQHmaRhATyRjgKSvsj9RGnorDMkafdTDNTZut
	pLvIJN/et8AfiS6uWMBxLlmXBuHnYOJ1K6Tl7a2Uzb3WzHFaDdxid8jQMxHKAmPx6fw5RVcXlV4
	/wKki4irEiLYsK7RrvAY00Bn9zWWm0W/RtD3gtGRqOdRmH3nSI/161FPolzA2SbhZcw5+cKRfVm
	Omo9SA3BTbKlLkaMGWNHtgoR7kMqEuT3Otc2EtLBXvxdyFi8IcwlFOJ6CcY4l/O1IBm4r+jxVr9
	97ew9hhSjoN05u5871wCdQlyEZC1MIy8h1y/twI9RFAxl4nByURsxC6FM5y/D6Z2vXHQJXTf9dc
	ZRGnaw9XG2YMFlePD6XVN+ul/SiAvOvr8g23NO0VZ16G4TZZ9L3UVWonAF+rolHQ0GwJzSMIB8a
	ndVmO+n9+3f7OxfltRi0dFHA==
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr8296530eec.9.1794853894873;
        Mon, 16 Nov 2026 10:31:34 -0800 (PST)
X-Received: by 2002:a05:693c:6383:20b0:37a:c882:994f with SMTP id 5a478bee46e88-37ac891df02mr8296469eec.9.1794853893782;
        Mon, 16 Nov 2026 10:31:33 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm65747695eec.21.2026.11.16.10.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:31:33 -0800 (PST)
Date: Mon, 16 Nov 2026 10:31:31 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Liaochang <liaochang1@huawei.com>,
        Marc Zyngier <maz@kernel.org>, Radu Rendec <radu@rendec.net>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
        Sathvika Vasireddy <sathvika.vasireddy@oss.qualcomm.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Ashok Raj <ashoraj@qti.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <avtMA9bb9vwezquP@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3MyBTYWx0ZWRfX7ZqRKH5EFQJw
 kjAvjY8t5MiOvb1HsfKNJzfNfp1kCqEpHJHNHF0eTB7aNFCeXA5CaaVqPeIOhhdzKRnDeJtgu2g
 kdcg6tmM6/zbB3wE+X79yAH+7bKC4fQ=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb4c07 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=3lHpaRzwHYXERcAFG5gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: a28y22ZLovRwkgTDrVSWwiHd8lGe3-i2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3MyBTYWx0ZWRfX17kdv8y6tbdt
 gKtYkGPAUsEGfwZhJaHrsAxRarMPGxLfgbvI43hPnIyY5SUb4+xB1aA4D1NnxsEnOw/6IQxiGsp
 ashHphDw5Z6m/y13Dc4jjGd1WfemvWDcc1hWsY0iXJKiDkZuwSvtEBMcWR81MNKNiT9gMmH/T9A
 qVmpEYxqV9USwzpdXMdVNTnrS7hwaH1NOdK+glaqBDnxqtR4fxyrsMoeZT9WRPp+UepZa2wbvTo
 T6SgRwVK4nnlod1+J9vQVklidilS7+1MvUgBDQDU+Cel8uZW671R1GG8phW77WFKCyx40wNCgQY
 aADE7zHneNCVksaNt8SGXy87R+I7zO1Ami/U9kx9IlZbUtaSf9CFQxJGBAme8yVfKlweJsiGg7Z
 6fj+ssovJVdFJjdN+ONf1ybH/OIEtYURNseClSqBO4dOJW6OxWPJn7d7Im0w+n1MhNKiVrOoLOS
 dDMYkh5AJ/EfG+zImJw==
X-Proofpoint-GUID: a28y22ZLovRwkgTDrVSWwiHd8lGe3-i2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_103136_914803_3660395D 
X-CRM114-Status: GOOD (  37.65  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vladimir

On Mon, Nov 16, 2026 at 10:38:00AM +0000, Vladimir Murzin wrote:

> Hi Ashok,
> 
> On 11/14/26 23:49, Ashok Raj wrote:
> > request_nmi() currently models NMIs as per-CPU sources. This does not
> > represent a globally routed NMI source with an affinity-capable irqchip,
> > which needs to be rerouted when its target CPU is offlined.
> > 
> > This RFC adds IRQF_NMI_MIGRATABLE as a request_nmi() registration mode
> > for such a source. It remains excluded from normal IRQ balancing, but the
> > generic startup and CPU-hotplug paths may select an online target. The
> > second patch fixes the related /proc/interrupts display: NMI-safe flow
> > handling updates the per-CPU counters rather than irq_desc::tot_count.
> > 
> > Patch 1: Add the migratable-NMI registration mode, validate that it is
> > used only through request_nmi() with an affinity-capable non-per-CPU
> > irqchip, and add IRQ KUnit coverage for registration and CPU-offline
> > migration.
> > 
> > Patch 2: Emit the per-CPU counters for all NMI descriptors, matching
> > kstat_irqs_desc().
> > 
> > Testing:
> >   - ARM64 changed-object builds with WERROR=1
> >   - ARM64 !SMP changed-object build
> >   - ARM64 IRQ KUnit run under QEMU with two CPUs, including registration
> >     validation and CPU-offline migration
> >   - local downstream GHES delivery and migration validation for the intended
> >     consumer topology (not part of this series)
> > 
> > Base and dependencies:
> > 
> > This RFC was developed and tested on v7.4-rc2 plus the FEAT_NMI v2 series
> > [1]. It depends on that series' GIC NMI support and is therefore not directly
> > applicable to mainline or linux-next as posted. This RFC is for design
> > feedback; it will need rebasing onto the upstream form of those prerequisites
> > before submission.
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20261112132042.129062-1-vladimir.murzin@arm.com/
> > 
> 
> I'm not an expert in this area, but based on what I've learned so far,
> NMI being per-CPU like makes life much easier ;)

I'm still learning the ARM side :-), so please correct me if I've got 
something wrong.

The events I'm working on are platform RAS events described via:

	HEST -> GHES entries. 

My prototype uses an extended Type-4 GHES entry (Type-4 is
just for the RFC discussion here; I also have an alternative based on Marc's
earlier suggestion).

These are SPIs, so they can be routed to any CPU. But request_nmi() as
structured picks one CPU and pins the interrupt to it, treating it as
per-CPU. If that CPU goes offline, the interrupt is orphaned.

I see two ways to handle this:

Option 1: Retarget on CPU offline. My POC registers a hotplug callback that
picks a new target CPU. If none is available (e.g. this is the last online
CPU), it vetoes the offline. This works, but it feels like a band-aid.

Option 2: Extend the API for SPIs. Add a flag that lets the caller opt out
of the per-CPU requirement. Affinity migration and retargeting on offline
then follow the normal SPI path, which seems more natural to me.

I prefer Option 2. If it fits your series, I'll post the POC as an RFC for
feedback.

> IIUC, one of the main problems with a shared NMI (as opposed to a
> per-CPU) is handling shared state. [...] the same NMI handler could
> execute concurrently on two CPUs.
> 
> IIUC, one of the main problems with a shared NMI (as opposed to a
> per-CPU) is handling shared state. Consider:
> 
> CPU0                       CPU1                       CPU2
> 
> ---------------------------------------------------------------------------
> 
> <NMI>
> handling started
>                            set NMI affinity to CPU2
>                                                       <NMI>
>                                                       handling started
> mutate shared state
>                                                       mutate shared state
> handling finished
>                                                       handling finished
> 
> IOW, the same NMI handler could execute concurrently on two CPUs,
> potentially corrupting shared state. Once again more than happy to
> be corrected if I missed something :)

There is no risk of the same normal, non-per-CPU IRQ action handler
executing concurrently on both the previous and newly selected CPUs during
an affinity change. Genirq sets IRQD_IRQ_INPROGRESS before dropping the
descriptor lock to invoke the driver's hard-IRQ handler. If another instance
arrives on the new target while the handler remains active on the previous
target, the new CPU observes that in-progress state and does not enter the
action handler.

The affinity update is not a synchronous “wait for the old CPU” operation:
the interrupt controller can route a subsequent interrupt to the new CPU
before the old handler returns. However, handler execution remains
serialized:

Previous CPU                         New target CPU
------------                         --------------
set IRQD_IRQ_INPROGRESS
drop desc->lock
run driver's hard-IRQ handler

                                     affinity target is reprogrammed
                                     a subsequent IRQ arrives
                                     observes IRQD_IRQ_INPROGRESS
                                     does not run the action handler

handler returns
reacquire desc->lock
clear IRQD_IRQ_INPROGRESS

                                     a later or replayed IRQ may run the
                                     action handler on the new CPU

Any required pending/replay behavior for an event arriving during this
interval is handled by the applicable IRQ flow handler and irqchip semantics;
it does not cause simultaneous invocations of the driver's hard-IRQ handler.

Does this make sense? 

Cheers,
Ashok

