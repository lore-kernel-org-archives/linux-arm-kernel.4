Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61815606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ffys7tQ+;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CK972qqv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4pcbxCQpHnjfej2Pb47u9IiTlMLuBD74I8/PGaiLL2I=; b=ffys7tQ++lzn4zhUp8B7165nnp
	DUIqjCVnnxxyCQgIDPE2N38ddtpP+U0de1GQKL9VcA6vKB6Wu2kr/t9TpWYhhV42RrAa9Cz7l/qV/
	5PkvGiopBTUfZhMbKPq8WajIt23bVm50BxXTAY/RJwj0DZGU30/s689zziPigg6TBJ7ZhbDpGJJ+Y
	+1RrTwZMs4uExW27jkVzei3wCBOTMjdxaYYiWKaCSDz1/E5JZQvFBnPmwzsnN8mHtNG4Ly4/DMdDR
	5nbmMYn3/PzNnH0IMivsaX/CAF8+GHwfNtJDeZA3AD4sXaQg9AYoqfOsTq8efLlG8gucEeFEMuM18
	rZ7ohMvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEzC-0000000AMa7-3NRa;
	Wed, 25 Nov 2026 15:32:42 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEz8-0000000AMZU-11HO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:32:39 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEYlFA1602794;
	Wed, 25 Nov 2026 15:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4pcbxCQpHnjfej2Pb47u9IiTlMLuBD
	74I8/PGaiLL2I=; b=CK972qqvhHaY9mSoR1fN6G12TGcYlVYcYEqAT1Aq/e3IWS
	ynI51DF7ld+ExOkn3RxrUa3gwcTO/KPC+LvPA6JpviEQonFriIk6eUoJMLb1drBM
	ulMi25ezUrAp5fgiIe7fY8jfUDx7jyzgHAkPro0eAR+DO/Eo/oWnj3xvAE6A21uq
	sYsUZjJHvCyoJrFHVqjWue1xS7jDF2z08QQc4+2LKY4rwvI+ebxCTvS9156cZhCg
	cfABEgBfK8vjmHfhYx2gSHmz4R5Fbs42JXlbRBIgeev8obpElC8/7WTgdqnxvcpg
	IODY/dyS0kiO2FeMY/kd7yZZJsXQKgeToTdmjONQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkn59d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:32:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEKXYX918513;
	Wed, 25 Nov 2026 15:32:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5dcuuv8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 15:32:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6APFW3SR47251732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Nov 2026 15:32:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABE732004B;
	Wed, 25 Nov 2026 15:32:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5167D20043;
	Wed, 25 Nov 2026 15:32:03 +0000 (GMT)
Received: from osiris (unknown [9.68.29.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 25 Nov 2026 15:32:03 +0000 (GMT)
Date: Wed, 25 Nov 2026 16:32:02 +0100
From: Steffen Eiden <seiden@linux.ibm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Fuad Tabba <fuad.tabba@linux.dev>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Andreas Grapentin <gra@linux.ibm.com>,
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
Subject: Re: [PATCH v3 03/23] arm64: sysreg: Convert OSLSR to automatic
 register generation
Message-ID: <20261125153202.117976-B-seiden@linux.ibm.com>
References: <20261106-sysreg-v3-0-75e95980fb10@linux.ibm.com>
 <20261106-sysreg-v3-3-75e95980fb10@linux.ibm.com>
 <awbuY0mETtZ_mQh3@e143914.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awbuY0mETtZ_mQh3@e143914.arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX/NUMUPbHtYAt
 SBqPklk9AkJR3xQscWUb+f0DjxT6kV/kKyzTYS5sjH9ZUCJKAnevQu5lvkNmNh+mx00OUGUbkWv
 jjuibY0pkEKt11siKIMCPZBdMM7+kh87ZffPZTmOE+1PW1vJEFHSe9Pfr75pGwpU7SnJXK5D/fu
 Q6+6mflTmzly5fnjhelCX+ItgipPuvYH3MQVR9zJSeHPDz1rYtwO//md7N1hUElXhKmJmIImyKv
 hu7y/Qi6rk11KeIp3TsafWBK7TS1cItcezbca1z1MtwFvcu3WAKG1zGdSyB9uAC+ztihTfPcNeN
 Qmiiz5zhivgKFBWqy+ulxfuQ6SGFfRMPScr37x6z+08KJYZjxqxdCYnPFnTi4zUHCIf7Hluzgdz
 vseauTpOvxUOR56QY+uk4nNORRVOu97Z5QLioztStQoE+elhWx2xPbXw/pcIxQsZWLYTMitYBaH
 QVyQsynlLGhvzytPSIw==
X-Proofpoint-ORIG-GUID: CDsbJr9gK51GZkzZX73S5vFuDg4Ga37W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX5OJB27YFMq71
 CL5nVKK5wn9aXa8dxUuOKVGJmZI2slPpKyMf+o5SEBSifgf+gSzy0to5MSBMpx3qm0etWUh0Tj6
 4U3lgNkIfqMEYbQ1Ic+dIShZjB1aEQU=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b06ff78 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=7CQSdrXTAAAA:8 a=kDbVKrEIACoO4ZT2jxoA:9 a=CjuIK1q_8ugA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: CDsbJr9gK51GZkzZX73S5vFuDg4Ga37W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_073238_286474_37B59F87 
X-CRM114-Status: GOOD (  19.14  )
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

On Wed, Nov 25, 2026 at 02:19:15PM +0000, Joey Gouly wrote:
> Hi,
> 
> On Fri, Nov 06, 2026 at 05:07:36PM +0100, Steffen Eiden wrote:
> > Convert OSLSR to automatic register generation as per DDI0601. As
> > OSLSR_OLSM is a composite field using bit 0 and bit 3 the combined
> > values are still defined manually. While at it rename
> > OSLSR_EL1_OSLM_IMPLEMENTED to OSLSR_EL1_OSLM_IMP to be consistent with
> > the rest of the system register values.
> > 
> > No functional changes.
> > 
> > Co-developed-by: Andreas Grapentin <gra@linux.ibm.com>
> > Signed-off-by: Andreas Grapentin <gra@linux.ibm.com>
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> 
> Need to do the Sashiko suggestion, it does fail to build.
>

Will do. I'll update the tools copy as well. Thanks for the reminder.


> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> 
> Thanks,
> Joey


Thank you, 

	Steffen


