Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD8B606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 14:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E9Uq3IQq;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SlJiiYr7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZQRDYuH2JVJMipJTF1ZpATp6Z5EQ/FZ1YThiVxgQw+o=; b=E9Uq3IQqdWfoi7k47QK1tG3XEO
	ENwZJAR1yTIazXBg1GGb+Xq91T0ywNhb31+zZP8ZQs6eE42kvM/5DA8QubBbH7MafkrUARPQbEPLd
	sN805Zd/VOIJXZEFmRgdoiPl4Q6P7YlVv8O3vtCXTNA1IU8zMytFNyRR4f5ABjdKwf57xn9rzhQnQ
	fPZ5czGXteAm7WnaY6zVZsueFPwg4SWEi9twjxY5f42DhkGpLqbxFgWTkszZBsbDugxAms8or4Ktn
	0495f856VhZgTq/NTBVhEMeFIK2BK/Sxjp2wmQJtjrk04z/v9Z+TdD1ke4B5GR4+i2AmdB88oXZoe
	wQ1YgkyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh6A-0000000EnTy-18N8;
	Sat, 07 Nov 2026 14:08:50 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh67-0000000EnTU-0lrC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 14:08:48 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7CEV7S4064173;
	Sat, 7 Nov 2026 14:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZQRDYuH2JVJMipJTF1ZpATp6Z5EQ/F
	Z1YThiVxgQw+o=; b=SlJiiYr7hX+EVQ3dZK7oSeJODkpwqM7OkNHQUgvNZ+5zZd
	+nlpdsndnpnTUZj/gMP2ixGMonhWHd0hD3wVl87BImGzB9UOMoYckCjd9/cifl1x
	IOv121nDKnUsFsbOToYTdvgAExYvwRQ34EYE9u7JGgDLySWZOdzbLKLLILvcQNxC
	nM4Z5bv4njUzs3ydxn1buiIbobjrg8Sw7uEQtTb36mMj7eIWFRe08BEuaTPKQ0R2
	b/uA7EMs19+4ZXskO9JNTO36VaDqW1mOKNXaLXCawSgxVrvm8c4Y7YZlhS60g6aV
	xhiAZEghP3UyyS6L3Vd7eI+eo55Z7xRdugUpiOEw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4hsunsjdfe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 07 Nov 2026 14:08:27 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7C4xWw3992538;
	Sat, 7 Nov 2026 14:08:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4hs7h1b3xq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 07 Nov 2026 14:08:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6A7E8M5Y29098370
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 7 Nov 2026 14:08:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65AAF20043;
	Sat,  7 Nov 2026 14:08:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40B3420040;
	Sat,  7 Nov 2026 14:08:22 +0000 (GMT)
Received: from localhost (unknown [9.111.22.167])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  7 Nov 2026 14:08:22 +0000 (GMT)
Date: Sat, 7 Nov 2026 15:08:28 +0100
From: Andreas Grapentin <gra@linux.ibm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Nico Boehr <nrb@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>, Paolo Bonzini <pbonzini@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 16/23] KVM: s390: arm64: Implement arm sysreg managing
 infrastructure
Message-ID: <au8wJDGsi-6SBVt-@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-16-75e95980fb10@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-sysreg-v3-16-75e95980fb10@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA1NCBTYWx0ZWRfX1nXHMt0dKqPw
 6dAIAC0vw8kH7ekYS9IDmMR2jHKMYhppsDoCGru/3agVnKRtW7L3EWqCg3KEcRrEY5A1crosFKs
 KXnBIpsM1un5BwPI243k9G9BIODtbaZfYF8Ahxcaj+Md5/AM0Qp4WiXY6pMqiC9lnHMfIdUDKoq
 QMQOaNhBzxu9+cfEwj7maEmljAcowThjWrTgs/thBU/aFx1ssp4XDhSCIJ/nygvQtgEsD52QK0r
 LGipX4j+kzKxxIvRkidYHcgEXTgUcpfzLogIDtyGFhpigmIpClhc19MKiKXA7uiHX4Y5+9aM2ks
 H/09u0Ti2v8g7aeytx6t1JXTrWyOVUsdZBcmDa/r57W5jbEf5sHme95ZslI6dgQDPgIwiAKmh4F
 vdwdlxkP6ms0hCtFbu9J7dH+tCdgnsxsdM0i+5sREMe8n/eGBOhkVr54QtFToShlN8f4ynNwunh
 lonMmdFezS7rbBDRCyw==
X-Proofpoint-ORIG-GUID: 5g6zsN_264zgD7K1qBmX3_vWI_0WPof2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA1NCBTYWx0ZWRfX0a/ttAfB2y3a
 UvqnqLvaLuqtseJ8jST+2O++lIhBL1ZOYRLoNcF4BBtByqTShd1XayujAlZNwYfgiGlwkrSvwnF
 rUBjfb7jerEXN0NjQv7u3pmAIYYSK2o=
X-Authority-Analysis: v=2.4 cv=euZKXYpX c=1 sm=1 tr=0 ts=6aef30db cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=jn5G6UVzRa4Rqx-XZ48A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: 5g6zsN_264zgD7K1qBmX3_vWI_0WPof2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_060847_236266_18174E08 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: -2.6 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Nov 06 26, Steffen Eiden wrote:
> +/**
> + * _vcpu_read_sys_reg() - read a guest sysreg with easr
> + * @C: vcpu to read from; if loaded, may only be called from its own thread
> + * @R: sysreg id; must be readable by easr; must be compile time constant
> + *
> + *   if SYSREGS_ON_CPU: proceed with flags = 0
> + *   otherwise:         proceed with flags = EASR_FLAG_SA
> + *
> + */
> +#define _vcpu_read_sys_reg(C, R) \
> +	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
> +		KVM_BUG_ON(vcpu_is_loaded(C) && smp_processor_id() != (C)->cpu, (C)->kvm); \

ah, this slipped through. the condition checked here was supposed to be:

    vcpu_is_loaded(C) && kvm_get_running_vcpu() == (C)

same for _vcpu_write_sys_reg below.

> +		(vcpu_is_loaded(C)) \
> +			? __vcpu_read_sr((C), (R), 0) \
> +			: __vcpu_read_sr((C), (R), EASR_FLAG_SA); })
> +
> +/**
> + * _vcpu_write_sys_reg() - write a guest sysreg with sasr
> + *
> + * @C: vcpu to write to; if loaded, may only be called from its own thread
> + * @V: value to write
> + * @R: sysreg id; must be writable by sasr; must be compile time constant
> +
> + *   if SYSREGS_ON_CPU: proceed with flags = 0
> + *   otherwise:         proceed with flags = SASR_FLAG_INITIALIZED
> + */
> +#define _vcpu_write_sys_reg(C, V, R) \
> +	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
> +		KVM_BUG_ON(vcpu_is_loaded(C) && smp_processor_id() != (C)->cpu, (C)->kvm); \
> +		(vcpu_is_loaded(C)) \
> +			? __vcpu_write_sr((C), (V), (R), 0) \
> +			: __vcpu_write_sr((C), (V), (R), SASR_FLAG_INITIALIZED); })
> +
> -- 
> 2.56.0

