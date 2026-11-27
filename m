Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95466606A338
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMPOr2DI;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PDHBc9+M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sJpOGIN7wWaS9OPFFA3XLzWt8cssgowcxB7Ih5loyjY=; b=wMPOr2DIH0sbZeGiiQfUs4NSXb
	DM3IK5SC18Wie804Oj5quTExj5E337FUl+R1YAS/mixPm64N8gkn6bqNBYeicjd138gFk0/TCrBSl
	hHcfmDTcz16JFIc7/n01452GvXlXBycHnq46VC3voZNoJ7AvEJ++CvuTLnOIk4ks6jo4pe+LMdDYL
	woxLp24VEuPU7h4+YcqQhPfqmr69VHteTj/6y9JbVLv5EwKJodmazYudf+cxboN/emS5CXRc1kyG7
	Bdq/Vj0SSwD6zqVUe1mv4CJz0fxF9AowJZLXyY/awqoI0mLP5NbPZZMESZyn+KcB6b43nQg/b72ha
	zzt8SJVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxMO-0000000Gf35-08bZ;
	Fri, 27 Nov 2026 14:55:36 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxLp-0000000Geqr-2Pzu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:55:03 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4i2P2011456;
	Fri, 27 Nov 2026 14:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=sJpOGIN7wWaS9OPFFA3XLzWt8cssgo
	wcxB7Ih5loyjY=; b=PDHBc9+MXFxQa3rBvsSl/q2mfzZW3sQaDn/uiesLhNtt56
	+u6OIgEkS2jz4d484m5x8oyAuKarltMM07MFwSr2GZoZhR2bgOyFMRFJPXCLi/Xw
	LRmmWcY3OfreyMBArVLEVrIegEzAOf3JDQKSNHo519tg7BPf+StToLKGG2vz1SaH
	esl1DzC9Pq/+IiLeXwA6W2LfBG/gGswwKCWmaV/zzfpzE3LWHBCTY6Q53YUMAToT
	9UWzNfoar5z1bH7x4N2Dm63v79n1AIGPxs95OicN5F5xQS/CWtFti2EmXnpP5W29
	sKu5Yl6+mf7cNrZrwZ6XfUkdHZIDYSdIj+zfyNLQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34p4w8mr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4H2w2819254;
	Fri, 27 Nov 2026 14:24:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfaahq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 14:24:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AREOHnJ51380506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 14:24:17 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99ABE2004B;
	Fri, 27 Nov 2026 14:24:17 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DEB442004D;
	Fri, 27 Nov 2026 14:24:16 +0000 (GMT)
Received: from osiris (unknown [9.111.4.254])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Nov 2026 14:24:16 +0000 (GMT)
Date: Fri, 27 Nov 2026 15:24:15 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Mark Brown <broonie@kernel.org>,
        Sascha Bischoff <Sascha.Bischoff@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 06/10] arm64: sysreg: Drop the leading zeros from the
 TRFCR_ELx.TS values
Message-ID: <20261127142415.333656-A-seiden@linux.ibm.com>
References: <20261127074426.50739-1-fuad.tabba@linux.dev>
 <20261127074426.50739-7-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127074426.50739-7-fuad.tabba@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX+f8F0dmz+fkE
 CJ1S1s015QkfvWL6pxXpSVZ5fCWDV7W9kajRlZjV1M/uDKZVV9HcQPJzDsLP3mpB8fWYbxPqX1u
 yPl8VZ0bo0z191yWGJvodoTLrrOhLnk=
X-Proofpoint-GUID: xnp1Mw4jLSvqvJI6opB6uAETiyPKt6iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX4E7qlor5du+M
 iyAicMaUabwei/9/IYpJy/cYtEpjzkjx467idWAamTEI37sPaYIeEE8stQSb7/iWopmoHPmp5Pj
 L3dhhJDhXEfgaU9xzez2lIiFIsnIKbCeFSbg1rpiWolabHROwmiw0lCM7m2Sz8y2VhNeKYHvv1+
 /BhZcRhRuOVn5K0d40HspKjhRmq+WmcU05vbzutP2HOF24nnR2jleEKxHcTTu8w1FQQ5h1EPK0B
 DFk0yrWRwC3KCh+l2uv8kz8ri5KUl5w8YF/MHsPx3HGV6v4WdtjD56d6WeP7GDLjYRTxuT687g+
 NitHjak5F/8l2PtfTLJ6aAALRP/phx4ft5D+zAqJb/qRaVR0Lpkh41LR7GoGQmZWBxz+af48jNj
 RwRYn0Lw7PhiNg/JcdpVgLJnoNjVCenbsPwhKhrU2a+1Jc0wfWwZtLku/PhYaQU9+EVuRfe9zH2
 JuBayD8pIeF8WibnLJw==
X-Proofpoint-ORIG-GUID: FaiqYHgPnOA1xh_MZK0NLZ57B1vVOi0c
X-Authority-Analysis: v=2.4 cv=QabzLcbv c=1 sm=1 tr=0 ts=6b099294 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=_J0aEeXxZ-ibMT8BTXQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_065502_068038_A09166E0 
X-CRM114-Status: GOOD (  13.96  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 07:44:22AM +0000, Fuad Tabba wrote:
> TS in TRFCR_EL1 and TRFCR_EL2 is a two-bit field, but its enum values
> are written with four binary digits. They're the only enum values in the
> sysreg file whose number of digits differs from their field's width, and
> the values themselves fit.
> 
> Drop the two leading zeros from each, ahead of a check that requires
> every enum value to have as many digits as its field has bits.
> 
> No functional change intended.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Steffen Eiden <seiden@linux.ibm.com>


