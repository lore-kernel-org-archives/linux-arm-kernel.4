Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 01:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGRY96ET;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jIvLBdsJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjaDwdps
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=; b=qGRY96ET8cFdL54WG7xx9o37Am
	9ZTRST83jHr8WAzBN9Rvx1RBHwezuzX2vgJlMZbFQPw/fgaY6TflaAgFQIL5XTH669sy+RwEq5RKR
	3nU7ZM1ZH9bujG0Rj2szjI8mQbSf8p9KdKFdSYMmqLFya+4lxS1r1QuU6i9qvKd3Glqidh/rwP0OY
	bzHY95OX4D7NobcmJZWrMQU5bXWftmbHEoS4I/uZ/5gWMiS6AoowUcL3MFUV9W+Nmk8iKfbcD4JZv
	8rKNGFQ9cZFpnePO1qEOid12d4bmryknWkmiiebPO1TqIdBL5U/LEYoiv5m+zpoj4mD7CmDPxDZ1e
	zHX8NMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUnU-00000007TxV-09dS;
	Wed, 18 Nov 2026 01:49:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTUnR-00000007Twy-1ukQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 01:49:14 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMes5u4172026
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=39gdEmsOXF3i8I4r1Zej3gbK
	6dbB1A557IW/nCHozLo=; b=jIvLBdsJ1LWlh+5MXzlaAESXTVEMsuv1CWz7ssSR
	90Hw3SztC9PAwnQXW6jksPZ21Mwog8xqvP4jKfvl31KWZqBPsdR4epp3qoRKdoO9
	RrbYr+j9hf4j9PQUqVzKEsWlN+b23+9rQe1252y9ZGaPlNBOuqgfvO5WHXhtLEjZ
	AaMVA4j/yjXNEy8wZB/uUDqV0CUD8iQKPKQwqZLDocec5k+vZfJD1bYxvCXbh8Pd
	hVPf5K1PPUUtjzrgBUUpMhvSnI1+IQThIUwHIDssKa/NmJP2ehITbcDK/SlO1E0v
	WnH6cH2v6wpJ9gQp/b9ZRfg3A7vJl70S/+HRRcze8lkvCQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv88k73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:49:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so936591c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 17:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794966551; x=1795571351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=;
        b=YjaDwdps32Kt/uRdgpePW2FqljDY8fxTN7GytXkvmMxXb9HIw75SGf8kJ7SN1tIF5F
         d2YIfR37lJ6bigUImmyqMBR8370WvXCamMT776ZYBPCai8gT1/zwI/JNMyJLrLWRU8Jh
         QdFXC2IQSOlnkvOsL2PH/fE+s1xeTrTtNJlj9hkr55aFqFkDNe2/FXGxf8IaVr4UekOM
         R/eoz+nlHoMjtLJJHlKOwXygJxE39CkUc7rCDiXFiwK4aGFukj/aDi9fZGycuaitfpq+
         RDPYQVTAtr7NDF8oBIeqAyp/XGcEKS67U4k/VT3/Njni06H5XVqFH66Z6+/Q4fSuJ/R9
         9mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794966551; x=1795571351;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39gdEmsOXF3i8I4r1Zej3gbK6dbB1A557IW/nCHozLo=;
        b=SMklKr5pSpFkXYbHNWOnBvzA6y4LG+9S3k5oL6GfUvdHebBilJBPv1gM+FlZUauZMe
         6alNCMl2gCEUyKyGBkLK2mTgVCLnTuLEkpmCvqjbVH/2i9+c8EWPVJ0mbqEC2l2q+Rs0
         o7OSQvlO8YgR9OeFFhjCmmhr35psGkuc3o84/raDq2rltFE9iSaAsGuY9T9TUWFgRdN4
         +AAVpg4pYDSaIb015N5xuN3HFbaOZ/8nz//StD/88qKQ1xFsYKGSUxfG3Ylctk9L4JBF
         1snL7BPn96Z9EDNgpnIc1428QRcjpVCNqtOroqCMtUqNec0FbK2H7LIkNnbEr82tLosQ
         ai3A==
X-Gm-Message-State: APuU4Z/ar61KtmBca0kzOT9oU3jreK6mW+RIPZ3jLBaXHhc4n0cdwk+V
	cSCE5W+41pC5ckDmdkxF5B9GWnzTimeW2J06Le9mjGd0PJ3hVw2LHni9Dl81ueWb0pMDynkMAXH
	zMBA44XD1rZTh3fc57tJY8zzFD82u2Wk5n71lfqbdjw54USboP39uWG22Qs/meR27dCOvv1GwGI
	LPkA==
X-Gm-Gg: AYBFou3kJOUkQDVyqp/YNCCX259rLLHMN0h2l4tY6im6jFkjnpepxKl12soArwmWbte
	g99cRV3s0VeZOtd3rT4TfWK57uQzkq0CJobwDx/td5/OUH2GsBDB9GJwLdckBbSeIN6uJXNitav
	vCWlSMMq5QnwjUOPToGMM3YuqTPJCGEocSbC+G3jFcIeICvKV5kCeFV5bbxrQ9A7ARVG73Pz+4f
	vG0YUCeMTcH8oyM3mnWSnQFt7OcFwaaRxknSGS/XepGfCY/qghHGW5ChdCktFFgbbgGrf9rCGLf
	sxbmRuL/w2oHbmzHQPXmfSNgx9r+kXdoqt1t81Y455XBj9rBo1IYmRpV0/wDIlfRAy92DVsMb+9
	YiXLiWQp9c6ewVttXmVBS5rQ4k1OvgnbyeT74KJ5u5V1TUbVxPjo8trayrL3xeD3D/7FFvHrHsc
	crpkhabL3Tnb768tS1l+iNhuA=
X-Received: by 2002:a05:7022:7e0b:b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b543c4204dmr1354460c88.41.1794966551047;
        Tue, 17 Nov 2026 17:49:11 -0800 (PST)
X-Received: by 2002:a05:7022:7e0b:b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b543c4204dmr1354445c88.41.1794966550447;
        Tue, 17 Nov 2026 17:49:10 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5446f954dsm2070664c88.2.2026.11.17.17.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:49:09 -0800 (PST)
Date: Tue, 17 Nov 2026 17:49:07 -0800
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
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v1 0/2] genirq: add migratable NMI registration and
 show NMI counts
Message-ID: <av0EE35H57DWF1E2@hu-ashoraj-lv.qualcomm.com>
References: <20261114234946.818072-1-ashok.raj@oss.qualcomm.com>
 <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <452bf82e-52ea-47c1-9074-eeb614a33747@arm.com>
X-Proofpoint-ORIG-GUID: iuNqG06b3-WU1rQGTbQydgXHnzx9r91k
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afd0418 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=hmA-pMIHEFdmMcvF4JwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNiBTYWx0ZWRfX5JP1A4KSPLIe
 e8QpVHLGbsH/hcoluJOqiXIrcLqWPQ6w2QMO3Dizt4AGqrq5j9Qv+On/ngNXzE0fk+TMD/TpR+F
 5sIVP0ivXWBf0aECUd/0s9B0sHEaRjT5yHdGJbQN5RrQUD6ut0DlxLHZswjDwlSui8D0q8aSfpE
 ho7YQI2rAM6bubiiudmsxq6Nt7AtiHth3kSqShcJtpijcXJzQWUoWD54OgzVHWEq1BboaXOgHqC
 8sh7OPCp6vCeGHZSfGdQJ94u7nnZ+3wzWFYBWoH3AoxG07RvIVD3uSxwnwjj78/Fp8LsGQ6BRhQ
 Lyj8sIMcOc+T28vlUVfZQM6AlnHaQ1liHtqga0+vPRBS8AvVyrE/hwmmV+d8jYicVhUfUC4Krh3
 1tDTepBXrFip5J2mW6SDSA9YKUz0L4aTfBi+JEt8RQqvVsozOxnuY157JJTUu/tuLJJgvq0zW2/
 ScSld+fG+xuiNFk3Lvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNiBTYWx0ZWRfX1kyBtN1iTiPK
 DlMgFT5xehXM8g3pllFHH+cHK0QDCoYAIukQNqLo1oVOX71F7+D//GFw7vYDZqEeWtWCXs+p7Ym
 f9Y2qLkWUyv4cJbEMul7em+2WPINFME=
X-Proofpoint-GUID: iuNqG06b3-WU1rQGTbQydgXHnzx9r91k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180006
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_174913_613789_21FECAA3 
X-CRM114-Status: GOOD (  32.78  )
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
> 
Thanks, you're right, and I got it wrong in my earlier reply. genirq
doesn't serialize NMI handlers: handle_fasteoi_nmi() takes no desc->lock
and sets no IRQD_IRQ_INPROGRESS.

These interrupts are external interrupts in the platform, not Per CPU
interrupts like the perf kinds. 

I'm new to the GIC, so I'd like to check an assumption. On GICv3, an
active SPI isn't signalled again until it is deactivated.
handle_fasteoi_nmi() calls chip->irq_eoi() only after the handler
returns. 

So I'm assuming a second CPU can't be sent the same SPI while
the first CPU is still in the handler.

Is that a reasonable assumption? 

I didn't quite follow the mutate shared state comment. 

I just interpreted thast as "handler is now called in another CPU" 
type assumption.

Cheers,
Ashok

