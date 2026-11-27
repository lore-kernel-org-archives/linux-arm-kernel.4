Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1B5606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I9oEeoL0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=aAkia6Ja;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZDGkpVFV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=69Boeb8mRxWk2/KhwOa9TkdVF7ruaVgxWOjUsLjcTpc=; b=I9oEeoL0ffJ95F+C4SoLDB6msK
	dePvTGlwADI+J5nwPn1RhM2HccKqO0hr0GGWRt8MDDnGOeXwTuT1COovXYb7/04PkUBOLhzkjV1RW
	1o9JQvguC2JYz3fIiC/iB6HkLfVc1y9qAR3f4OKp6N99dejOKMpx0k+2M72SfND/S40XiWXzPhOfk
	KDCm61YQtuWo6stfZaS0Ud5KH/j2GNXepmcl4Mvtdzlb8nz657RTnIjQjJE23z+K+rujq1xTKp9oa
	pGqCQHGylVSfT6AiL/KAKuajnbrj9YcR06sD37z0cPpmagZzbDNZ2pfw7GRp13HXri9Y6XC4q//Rk
	nzXD2m3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxMN-0000000Gf2d-3p7k;
	Fri, 27 Nov 2026 14:55:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxLn-0000000GeqQ-36MD
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=69Boeb8mRxWk2/KhwOa9TkdVF7ruaVgxWOjUsLjcTpc=; b=aAkia6Jaw65Q4KhkSzcW3Bq308
	KQH4kXMjjrc3TOUkkrahT7Axe0a+42amHYkWUVhDJ6OXK8v01yDbTKwqwFlJtUiXoxIZkt020i0gj
	aRB1bG9rYPqc6RY2wlRu1CVFA+xBME629ScGhdsUSGAsabmqUTUsdotEsKR9tZm24WSBsq3youkaY
	8HLYMpxPID4+p+/AhIy1AacYwTjlcn9F8rJLf3hjlej221rDBxHkYV6UAACAo8VlUt9MHvAksGXet
	Aoq0sHrSqwUpZ1lcjhJ+6+3adop9kg2OW/nolNFGfLwJLJdxIOxBM+poJ5n8TgXEhpI9F1Bpb/tOO
	Bozo+edA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxLk-00000007rYb-1P6A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:54:58 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4Uga3419210;
	Fri, 27 Nov 2026 14:24:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=69Boeb8mRxWk2/KhwOa9TkdVF7ruaV
	gxWOjUsLjcTpc=; b=ZDGkpVFVChFEKR0+HGRzJNBYnhG2tJ6KTUrekOfkh3eos0
	JWtb0Z439xqCSM7cyeu1A/nM2TXkC8fEKHd057aD14q6MzaJ7blsCwHu2UreD3oU
	O5Ul6pxJyK6yDdSNiZ23nrb5W/clPsNSkl3lUjjEJHdRzoyFyZy6ZDFA5LNYBnel
	+VYgJnovTEHQVB8TcP7OlJBU/4ArwzFoduMqt+3KavLA8ZeItoqAlZS386gX4wzs
	rQlmKsDxPrtmxgQycpb/uHIQDKZzJAq7qXxVO1yHarRgLMYI24mmqEEYdnIdC1C5
	u1oSkPGLSnyUjgbrqQlMW7SCx7CaUJQhmt+mV4aA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fap8sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4FdU3892940;
	Fri, 27 Nov 2026 14:24:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j6ucctxb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:53 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AREOpbt46465342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:24:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A4CC2004F;
	Fri, 27 Nov 2026 14:24:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD17B20043;
	Fri, 27 Nov 2026 14:24:50 +0000 (GMT)
Received: from osiris (unknown [9.111.4.254])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Nov 2026 14:24:50 +0000 (GMT)
Date: Fri, 27 Nov 2026 15:24:49 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 07/10] arm64: sysreg: Reject an enum value not written
 at its field's width
Message-ID: <20261127142449.333656-B-seiden@linux.ibm.com>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-8-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127074426.50739-8-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX6LfmeZNZiicE
 U4DgzlPoQRTCYs72LTqt3tDI3u6sxFY2U7LRAj4ChcxmDKaJBnr1Gam369GUhfxxfGlHFyhcnfx
 T4UETxjBTmIft5qNMb5NpqiFmiLCYyOo48UUZBHtkA/euwk4FT5t/Jh81/xJ9Bp3lylhvnjSGSp
 nUtuzN9pwMtbrChsMnHeADh9r9QVRWUvysYcoic0wuKCxLQukGdVgPFF/9adR1eBBDiA+tctaAw
 YVwr7piFOpyWgCF49y5Jm0MIaGEYUklwgWpEdIadrHYxBsgQTibn7MwlL/+u90TrsYD7xKiNxY/
 I3Nc78wNC8pdGNyayldUxw8w97ShQ7aFf4ZdNzUnNF9EvmGjxZiZw3xJW529LFiUbB+F16TYEoJ
 KIi8ZQXs5rVfVm56qq0s9/KbODoBCN9ITJDR7vZ67ZFvkOfThYtZNf3OKOHiBjZySWucuoRtR+h
 v6sP3aoSsZTjOCisxHQ==
X-Proofpoint-ORIG-GUID: siIcS3kY0a9R8TElJG9AbDqR2B53cKyZ
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b0992b7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=OUEnCn56XahdxCnzIxUA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
X-Proofpoint-GUID: Qbkhe7uRqyNltyMZpenIPvCIZr7g46S4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX1iX6K8X+ZL+K
 cKMF7vFrETr9bhI9wF0NtTNdLUDYvkLgsG1M+MISam7qTP+nDfS6whkvPzLVCRXM3nsOCtSGhZ7
 KJFWd/Y46FIn8vY+szd1/vYdou/1gBM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_145456_673208_E3C84242 
X-CRM114-Status: GOOD (  17.65  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 07:44:23AM +0000, Fuad Tabba wrote:
> The generator emits each enum value as written and doesn't check it
> against the width of its field, so a value wider than the field defines
> a constant the field can't hold. The duplicate value check compares the
> strings as written, so 0b01 and 0b001 in the same field pass as distinct
> values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> too.
> 
> Require each value to be 0b followed by exactly as many binary digits as
> its field has bits. Test it in the rule's action rather than by
> tightening the pattern, so that a value such as 0b12 is reported with
> its field's width, instead of falling to the generic "unhandled
> statement" error.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


