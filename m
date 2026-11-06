Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PKBJBmIJ;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=kHuByDj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=; b=PKBJBmIJfDkYf8BaQv/oZpFm1w
	aGjrntRjPSbS9G3d0ii8nbZ19s3KlIm6ioA6QFgtQAg0eF0/VgSg/fCLKOl/TmspT1YAKWGQFw1oT
	9p6G50/USM9hqKzlHyBur36K4qCHAj7t8QdyNaFZT2ql/eh7nQ9z1Ppl/1ojDj0c3+cUmcSftvGPC
	o8H/KxX+aOiNj99TCHuJFc89vCUHnjP4v0Phlr4L8iMt0LGO8+vlbjJnRfHSAvmBD7nrcm1DYFv3P
	4rkxo/MsIQcWSXL50CRQtZgvLHowWGY9B9Z6Z2vrK1WBGemQkYPAdEBXp0sDbH2MJHx747/sR11RH
	h6ewGsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNa0-0000000DCW0-0KKd;
	Fri, 06 Nov 2026 17:18:20 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNZs-0000000DCT1-1HKN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:18:18 +0000
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Fh3hv2226201
	for <linux-arm-kernel@lists.infradead.org>; Fri, 6 Nov 2026 12:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps01; bh=T59m8WXKnLMZksH0X3OIVWtfvJ0H
	ewjqtyBEFa8ziT4=; b=kHuByDj0/YKHgTsrNhhmedA/FP7mqZGT62dRvXg9HauW
	gMDXV8u3jnw8J/ppSffjbBmhjR9FkIx0Xom/frHFEyHtVSi1goB/BSTlcqSchrXC
	6jMvdcldqNdUbPu4DAvgWToTSzCJIPBYi+yPI8++eJ8IRtKJHiwN1Y6gWUIte5lF
	BfJHkIRFyabKynbxbjYeeY9H/1oBQzjRcLJPSH0t2CufgkrzCB7oIsjcrnSYipOG
	QclCid9TTrSlHujzXSwdlDiU+Lm9V/LvMw49Na9FygTqG/Bx3dvgIbTx6lYXwR7W
	GHipks+eota340S1R1pnBuF0brvaw4Af8cV6C2dwvg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hs3pbw0db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 12:18:07 -0500 (EST)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b347619fe7so11386747b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 09:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985487; cv=none;
        d=google.com; s=arc-20260327;
        b=pEBLripOoWQG1DwlAvOQpU9MPLlyE8v1SGyroovM457c276BVFyVXQxm6srwByJnxr
         VtY6LeeAbp9eje9PFnq12QgFra2Qvr/romgc4MvlC7ZMXDETbbJvhn3wfaD+tcLe1hP6
         8TTQJzjXj8fmRO6X/V2ZvcEX+qCFke0LQVT5mJ1+t94zw8xLhGbSsZyQ6mx8mIyCk8jG
         FumtT7gfegBMLIZrQHGSNTNU3ADRwssPLnVNRtgER/+gPYj1gQmh3u0V8hS8jrZ4nw2Z
         5kGg0F7MN0NWkwLVQAEOvJZURk0ZCWkZcHANHeRvJabandRLI4qJNUyqMo8Di+7+yE8d
         I9Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=;
        fh=JOUEbhkliDSO/TDalUGh8o9FPhtWBz4W0f9o9jYdV/I=;
        b=UiuqrTV6Ff/qnG1YnG3j0hzLM0LHsRQJOIHAt4B1DE0l47LDHjuumNWkeRdrFsM0LC
         p/Zmp1tCtaMciXWtN0rJXqGpT49Y85SbAkpktU+2QQIGniNSsw6XvzeBZ9cJQjtgZ/iz
         iQM0B7q4AxHNnXMSotr1Xzr2VTVgoCXOi8/oZWROULQkIeIN9vHAe/jSVwqrBt2b3/Cz
         TA+SmkQycF2kuAdH78n5l0rYzx/zJrI5+7JaDY07RnTF50RogdQ93VYNIeWj73mxvzb+
         UELqVNPWDYCJri9z6FDHa8bO/DO/g3OsU+0TaH1o8T/0OPkUa41KVORNMk4Ja2Ezb91W
         iQ9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985487; x=1794590287;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T59m8WXKnLMZksH0X3OIVWtfvJ0HewjqtyBEFa8ziT4=;
        b=gDUdWBMPgaee2pE08760RQcHY/e5HDxo9HtROjF+dFR1eAbbzAZdAPk7lUl9VW2V46
         DcZq7tnwONKQQ/e0Cd12CQuy1GGUFOmpzefLBpssv92/POscSuFMtHQ87HviSy0H8xUy
         +eNehIJmTccFTtqRUyypCHoBK8ArcZjTMbplNzPZna5Dc57zW/4bUOJ8z8VD0Z77xivm
         on2Py7Gt68mj1nrFN+An/iGzYQUYMV1+hEbgGSn/iczZGo51xhUjleGrx/IKPSGfYsrR
         2pGFJTTfQYrD3CrTwIohjXXruuhKYT1mhUXBnIY1toxVHpZbB2i07K2BCzXRQxKvayeV
         jQ+w==
X-Forwarded-Encrypted: i=1; AL+hErE5hhLzn87tQJjyusAfExGx8PtKguK6hDYnrO5Jnn1OuH5TcV4KW6OLZsBd0aJa2LjP6xHHFPqt5zA1RYX/VfNO@lists.infradead.org
X-Gm-Message-State: APuU4Z9U5kBNFakgKkSB3FiOkZol6OE41h5YX+L0tszmGf7RAwqw1g/o
	sJZL/y7v+QkVi5NoVFu/3/XGQv7kC6jpr761BFzOjktp3DBeERQcpew/87cPBfuJJSCCYc8zCX9
	+BybvjlVMk+Gl33qOdGnQpbiRGfVsMyHp6hp81wd/FNNVoqHpC94R9GUbnSlEl1QOvzAJ4pDqXe
	5kxFSdVfK3SBB9Cp2TkZTU3c36U+jcO3Qn3MV4XKIuT1KnmDo=
X-Gm-Gg: AYBFou1+Y4MV8Z65QllUfvwOIMrx9wwi4Pi2kJ7Bg5DB8RZOgPI2awTM00ZunVf3iys
	0cOZlsRqmCB+/my3iH6lVSbiRJRh30Tn8I8yqlK0+yZRz7iO+tYhQPT+Bib57IxfLhvCC82SLmO
	ZDScZRHvGZFtFfGjwJC9aKCbBZa+Wwgf7nUxPndsTOi1AaHd1i6aoppd/+CsxHM3C0leLOz8IGY
	kFYYq6/fTKCcf2kICpZJSDC9HGoIWu9Ja61Ri9S5di/RXqhlBY7QZhoaJPEf3qy588niJMbBGhu
	KrMp+bIvt1pwXmQ37MyVYouWKSDpzMwDEw==
X-Received: by 2002:a05:690c:38b:b0:8a9:e801:231c with SMTP id 00721157ae682-8b3418de960mr15159257b3.20.1793985487297;
        Fri, 06 Nov 2026 09:18:07 -0800 (PST)
X-Received: by 2002:a05:690c:38b:b0:8a9:e801:231c with SMTP id
 00721157ae682-8b3418de960mr15159067b3.20.1793985486807; Fri, 06 Nov 2026
 09:18:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
 <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com> <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
In-Reply-To: <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
From: Xuheng Li <xuheng@cs.columbia.edu>
Date: Fri, 6 Nov 2026 17:17:54 +0000
X-Gm-Features: AclHuK_9svrT6wKNkNHEsIMr6l5W7zWgD8S3IUtPesXe8MFok8Z1sXe3kPtMyT8
Message-ID: <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
        Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
        Steffen Eiden <seiden@linux.ibm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: XSa9Eq70BILzCMwTyEI0P-0x_Qio-Zql
X-Authority-Analysis: v=2.4 cv=Jt5kP84C c=1 sm=1 tr=0 ts=6aee0bcf cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=jHxIr1HyPKZ_Q5_91PL3:22
 a=uYC8CqauRjbKsmU2jI4A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: XSa9Eq70BILzCMwTyEI0P-0x_Qio-Zql
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfX2o1fKJDuKTnx
 ceyfaaclhOfxb772Yrd6ioVFOEWXAJLRcaW/DTuG0pKVZOnEbGo4R+g15W3Sb6hRQommeMQX8mo
 PLBxPfpG9uN6+LJGoIAoSsGDcJ22cuVRL6fMZHHiZM1v/EnZvn/fBdqB9vAEe+uw5bsWJGU2cF8
 JrwUzXsp6Mby6g5QYoXwq8Y+ntnsYRmoQufnngEOLenjMlMq0XU6nCUQH8IEkG9l4P6CPiJmKFD
 KRA2DFg+KQ2LSkjSz5OwKCX6go+Rfc8nuZxErA0VQfAySZD1LvCkK0DVyQImo8/clc8aq1NGZRP
 A3dM3qNlIQw42QzYtobqaHAGJJubzfucD2yfXmGQaSLKLaaSXmpcSIx1k3ZtsmxH2EKeffxw2wq
 CDT+NOBoZP71jGJoLk21rGQwvPcQiFer6xOTfgYZLugiBSNp7wrg0Q7ueTq2EiJUCKXAotFzmAj
 buK/4ugVFIubf0+CcWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2OCBTYWx0ZWRfXwBstoeDxw16H
 d3r1GTmYhASYQpN5n6xMH87kiGeudlOBuYRv0IOP+Ba4ERhel15GHXdQpRjD0QumGphSKjIhiGl
 t//+hSZuL72DPMuYL8NbqF0Is2cDK+O2DY2VbJa8EaPNhnKLCChJ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11958
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=10 clxscore=1015 impostorscore=10 phishscore=0 bulkscore=10
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_091812_480434_B7AD79C8 
X-CRM114-Status: GOOD (  12.26  )
X-Spam-Score: -2.7 (--)
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

Hi Fuad, Vincent,

On Fri, Nov 06, 2026 at 02:34:55PM +0000, Fuad Tabba wrote:
> Actually, like Vincent pointed out, why the WARN_ON(). The caller can
> just handle the error.

Makes sense, I'll drop the WARN_ON() and just return -EEXIST.

One thing I noticed: the kernel-doc of kvm_pgtable_hyp_map() says that
a mapping over an existing one is "rejected with an error and a
WARN()", and the leaf case in hyp_map_walker_try_leaf() still warns.
Without the WARN_ON(), the comment would no longer match this case.
By the same reasoning, should the leaf case's WARN_ON() go too, in a
separate patch, with the comment reduced to "rejected with an error"?

Thanks,
Xuheng

