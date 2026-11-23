Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08AD606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SjlYoOC4;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T8eNMmJw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xIqRuuyi3s4SC841Ot37hEBBxupspYSo1v4iRKPGuWo=; b=SjlYoOC4HOkVbmtFO9G4zKgVfq
	gGIjckRdIrv+H3DENT2Ro/azUB/I9WdLcI5qj55yooOsYf292P1f1ZJiuRDLNdGkLfG3olaOti6zH
	vpHaql18IsG6Kx+I8mAKfkvew/92VIhJt2x31nW540J5BvUrgMcaZJmzzVtw+90acotSi4EmcaAcq
	vGZC9sj+je6MmbOAYMcw3UgycKRbaOPw5+ipDEhvep9e0PxJmLv1HNaN5w85IM0+betWimJyx6AiP
	zoLkmJVt8zzSfjCk3N+nX0DXPxAign5n3mwMLrG8yAZeM3uz38SQU/vREjz/um0faaImuhYFDsrd1
	QIAbB4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRYq-000000031gM-0zPk;
	Mon, 23 Nov 2026 10:46:12 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRYn-000000031fI-2FMQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:46:10 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9YX1c3194393;
	Mon, 23 Nov 2026 10:45:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xIqRuuyi3s4SC841Ot37hEBBxupspY
	So1v4iRKPGuWo=; b=T8eNMmJwE9RlUSpm4gPa94j3iz/6gi6WujSrHaOSFq7ieH
	sS4BWpaXmVv8kNkas+sGuO7cNQmfEzknjTMWBaRl1st/48UQXMAtNhbsYRPBE+CQ
	vlYuShTODi1aqhonxZTtysMCPmszg3PEFI0tLOeF7W7GgGtkak/F1BtZbe77fs4v
	k54Tqmtn1LonaX/WP3VWYfK7iI5auix64hGQIAyvX4Bb26MIxm+bA0nLpF4wQ45s
	RaTlZMOKfuflMnYbKMDzCdij/QD6AHeAau56h0G+cciHmGBN/j7yxFtRs6EnddS9
	i6ZvpE7aXxrlu5YH0xtMvzj0SoGUbwe3GwdxA5ew==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gv2gaa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:58 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JHxB1708408;
	Mon, 23 Nov 2026 10:45:57 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3raye62q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 10:45:57 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANAjtRi32506604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 10:45:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABC9720040;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E9AC20043;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 10:45:55 +0000 (GMT)
Date: Mon, 23 Nov 2026 11:45:53 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
Message-ID: <20261123104553.20959-F-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-7-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-7-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b041966 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=IEvGn1zUL_vtJd7OkNwA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2roCqqfTqkw8
 YEROHFQZ88IvlrCijNa5miUOeg4EVxim4+TWlmYUoVkjcbrShgur+68IB8xIYpznvYd3iorjuUp
 2HQRU4PRh4zrlr1Ue32xFdaMUkIoLCY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX2FPRqvNF3h9r
 KChK8u5v17NX6EmnrQK+2oQMkLb3cEm2E0YXQzzNnRnff5pDAuswZYx6yHr4XbQGW2lYSmoxFvQ
 bH/rSu89Y86ggNF1opMZ4HWP9m7mTPIaSJDSUew9XvahLS7xQZ9L1k6c4LXOrVeWQmuF9iiAfc+
 Tp5J5OZpIqXMxFn9WGTRStsfDcGml51+2Uxm96QAloGG3dOYtuiYUth4Ob9QdYUZiDQKkN7eIji
 35QoEXxvCve/P7hIKN0+zCQbWMTsjbS/+w9QZYwz/CD1TKCpH/nciTbLEr3Nv/7jlEe4ivQtUq5
 ezEfVYSlIZzUmdicQ21aofr4zToRIXtlrDCAbZghTDiyQsgsKIvej5O8qFi1gBOA2y2/634Xyjt
 OK7foVdUYOIf4DY6LNhx6zJ0aJXjihT5TT397rcp6c7I+m9Ku2awncg4sOIuCvCYQzkwHo8EGin
 BE+C8CqjVOaDrgEbZag==
X-Proofpoint-ORIG-GUID: xvXmXRxewmVX3uEZMer83MfDNwFp9XZn
X-Proofpoint-GUID: 49DySJUMN-cKB_jeklQg8KakNNn62Xjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024609_700013_609B9749 
X-CRM114-Status: GOOD (  25.82  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
> 
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. The one enum written otherwise is TS, a two-bit
> field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> them with two digits, which leaves the numbers unchanged.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/tools/gen-sysreg.awk |  3 +++
>  arch/arm64/tools/sysreg         | 14 +++++++-------
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 

Lets split this patch into two: 

1. Fix the bitwidth of the Enums
2. Add the new check to the awk script

Then the fix is split apart from the enforcement.

The actual changes LGTM.

	Steffen


> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 1843d283192d2..cde526896ed96 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -367,6 +367,9 @@ $1 == "EndEnum" && block_current() == "Enum" {
>  	val = $1
>  	name = $2
>  
> +	if (val !~ /^0b[01]+$/ || length(val) - 2 != msb - lsb + 1)
> +		fatal("Enum value " val " for " name " is not " (msb - lsb + 1) " binary digits")
> +
>  	if (val in seen_enum_vals)
>  		fatal("Duplicate Enum value " val " for " name)
>  	seen_enum_vals[val] = 1
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index ebe5c5bd6fef6..5b587a7544e40 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2919,9 +2919,9 @@ EndSysreg
>  Sysreg	TRFCR_EL1	3	0	1	2	1
>  Res0	63:7
>  UnsignedEnum	6:5	TS
> -	0b0001	VIRTUAL
> -	0b0010	GUEST_PHYSICAL
> -	0b0011	PHYSICAL
> +	0b01	VIRTUAL
> +	0b10	GUEST_PHYSICAL
> +	0b11	PHYSICAL
>  EndEnum
>  Res0	4:2
>  Field	1	ExTRE
> @@ -4300,10 +4300,10 @@ EndSysreg
>  Sysreg TRFCR_EL2	3	4	1	2	1
>  Res0	63:7
>  UnsignedEnum	6:5	TS
> -	0b0000	USE_TRFCR_EL1_TS
> -	0b0001	VIRTUAL
> -	0b0010	GUEST_PHYSICAL
> -	0b0011	PHYSICAL
> +	0b00	USE_TRFCR_EL1_TS
> +	0b01	VIRTUAL
> +	0b10	GUEST_PHYSICAL
> +	0b11	PHYSICAL
>  EndEnum
>  Res0	4
>  Field	3	CX
> -- 
> 2.47.3
> 

