Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D452A606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=16I2/x9E;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BC7v7xeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ApkHWbRlHzxhfqiZIL1iGj8G0oUAxR6wH3+OPuEEzVA=; b=16I2/x9ESaahwdofJeNC5u9KCT
	h2hFKgMWfkFFD+tcsrXsAP6k/fS8hzYdlzoRzlYF9PRo27MgiyiCuiVjYvy9SO+tThavUMVftg6cM
	q4zZQkxUcc19O4wExkZr3oquZtg+E8Giu69z1nUREdxA2O7VoPA7PUqo41EjABGA5XG8hW4mgqY7l
	21I8/Z3zTQ1QUovC7z+M3E5D/hwgni9TTQtGINUK2hGlePTsqxCPFqWPvlDCwoAvPreXa2J9jSEC5
	doPqdtE+CBn0IVTW99zJ6UFVV44hdgmNIzFS+tHyvA/zBY9fxhxynVUdGhZg/j+0uFn0DRfIp0BP2
	H68nFKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8J-000000039Ej-2WgH;
	Mon, 23 Nov 2026 11:22:51 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS8B-0000000398F-2K9F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:22:48 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9YZfw3252048;
	Mon, 23 Nov 2026 11:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ApkHWbRlHzxhfqiZIL1iGj8G0oUAxR
	6wH3+OPuEEzVA=; b=BC7v7xeuiMQa5oBbTKxOUFmKoUQRfjj+RFxbNjv3NNywNE
	IX8UqPd5K+zwh+ujX5fHrtJmSiCZgh/bCIlKVoaVK+3N0WYyZkSRSV9UyNqneiJb
	aUWTzELIkrkhBsk3oLSC02vU55pmUtipRo091j7eQJDQfmUUhxwNn89qqXiQYkD8
	JisAV3uatfEKhEAtkfnE52XOSC4shItVvahgjTAy4heCX8PQoUcdZ1vr17i8ZVE5
	jyl6Mh4zYshwEvwdCxRh49cZLrBw+sB+id9C5w5GdjmzqU1V/weWIb5NxYKBOcLC
	d/dJubhQ7NtSNa0p0/Ze1v3HVzD9tvBF/3zVUUvw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34g12kpw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:22:22 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9JR0H1617428;
	Mon, 23 Nov 2026 11:22:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j3nmqesm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 11:22:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ANBMKHS31588818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Nov 2026 11:22:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 127B92005A;
	Mon, 23 Nov 2026 11:22:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A167C20043;
	Mon, 23 Nov 2026 11:22:19 +0000 (GMT)
Received: from osiris (unknown [9.87.148.25])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Nov 2026 11:22:19 +0000 (GMT)
Date: Mon, 23 Nov 2026 12:22:18 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 9/9] arm64: sysreg: Reject a bit position written with a
 leading zero
Message-ID: <20261123112218.20959-I-seiden@linux.ibm.com>
References: <20261123075219.369042-1-fuad.tabba@linux.dev>
 <20261123075219.369042-10-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123075219.369042-10-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: kYa156CEhzfsQ5KhWkTHgGXWHuPrwblK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NCBTYWx0ZWRfXzjsCjtCyx/38
 Vp8h/ZN6r8TnPmCsKgnZywd7F9mMPo446TF0/HL/n62SaQ1YO65dydBES+Isy+IfwiJvLhhE+km
 4yYWEfo+aSip1+zRqKcpE6sZOY6W5e8=
X-Proofpoint-GUID: KxRD9qQo8wWvf7PSn4fsFSVMkY9TpUfr
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6b0421ef cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=aFQD6YNGmoihz_4X8V0A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NCBTYWx0ZWRfX7XpN7mIG8phS
 s4OFWnvifqmUWG1fAbDwOE2wGiBfSpj0qIrKz5rZr8YVksR+4HmbCfY3EHSihvnhpD0Jt0aI0uO
 At9ziAFrXv+2BwBwVg4O0Es64m07koBMWnl3QjAeoZTNNl+wUbcek2oMUCGJpZSmvlPdIAc325A
 4riCz0o3mGTEpx4+TToFp6/fQnytNbIb0pFwYU7taLO4sRi6hBhAvYi57v2GPF36TIq0FoUBAWN
 jr9bg+F2poBffyQbiPkw2uHjAKox3/d7wc5W+oSWSliZEMH0hlPyOjZI+505OPtlGfo2aqr2KtS
 +NkbVf00BtKPafwBXnA47yNrtj8URgUF7M+5zEj88HcDYV23Ikxd0YFDsi5oRH5yOV+IqjDMjAS
 9qaWEMEi20te2f9Tfh99TXVCOQjTUSUciQwLcgzEhNrku6CTE6KQmsZx6GVqHf31aoRAlG7EzwC
 14cKnI6UU5/qPDu1Yqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032245_877838_BA719B11 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, Nov 23, 2026 at 07:52:19AM +0000, Fuad Tabba wrote:
> parse_bitdef() reads a field's msb and lsb as decimal and checks the
> layout with them, but the generator copies the digits into GENMASK()
> unchanged, and C reads a leading zero as octal. "Field 63:010 A" is
> accepted as bits 63 to 10, with the next field starting at bit 9, while
> its mask is GENMASK(63, 010), bits 63 to 8, which overlaps that field.
> 
> Require both ends of a bit range to be decimal numbers without a leading
> zero.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/tools/gen-sysreg.awk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index 057dc98082b5e..01b463e271cef 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
>  		fatal("invalid bit-range definition '" bitdef "'")
>  	}
>  
> -
> +	if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
> +		fatal(reg "." field " invalid bit-range '" bitdef "'")

The test is good but IMO the error message should be more precise to
what you are actually checking. sth like: 

fatal(reg "." field " non-decimal bit-range '" bitdef "'")


	Steffen

>  	if (msb != next_bit)
>  		fatal(reg "." field " starts at " msb " not " next_bit)
>  	if (63 < msb || msb < 0)
> -- 
> 2.47.3
> 

