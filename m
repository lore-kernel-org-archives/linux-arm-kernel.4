Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32A606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lD+Qqvv0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gwmsFTUb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cBE6o4Lt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=; b=lD+Qqvv0j4zTmDBy/Z3velSpKa
	sfO21bOPwjJIC5Tp7Jknko26HKnsUciFw5g59CXCtTC2wP70mDsZGNoxJX/80Uf1Dq77HvXy8YQ5e
	eJsHUE5dqgZu19zKAc7K7zEP2IAJ6TqlPgD0asIpXui96lK1P5vfufaiVX/7hZady2f0r+xLDNF3/
	RFJzYB+Qm5PNCIbE2jYtHtwdVbaLncv5DokBW/ix2Izh5y5/X13Y37qOFYjvv87Enuuu1odRivq9r
	dai85JzpBpLTSTdgep/0T2Nq9URx/OFebSkd4clmP1YV1H0S+y+Oxx6uNgiqmBEY8hueKDJ074zii
	cQAI7NHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZv0-00000004is0-0RIT;
	Mon, 23 Nov 2026 19:41:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZuj-00000004ihN-1b7x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:41:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnA01861277
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vUxC6ouspxhWBpss9anyN8/b
	pVZ3ii1paTC8Jy1Fd2E=; b=gwmsFTUb59Zlc/gg1IMdg77AcKGA2SPYuhe1s2Nl
	e00LRSFZUHuu92szoKHByqwXiKxGIB4AQNljm3o49yyhK8/9ImAeHMGZcLVvkmiM
	ti6br/HGCe5iVbeQ7ldCmOhUUxf6v/MZlWhkgSRGoOlB5hYQFQisbuj2GVIZvjxS
	C4HaAFhERQAAYk2ktkBBn2itn2sydqBOzcNvDrN/t0X3n0EzYiesLa3uVmxIiN7o
	XjaNwU8jKPfBwO1DMbNj5DZ4PzBDla/MFvne+J/fZyYgUHEvqbT0NQ7NoE++VACe
	I2GHZuAK+4p4lNdv90dhhaBhJ5FnFinUWCFrJtnKJ+9VNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a34at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:41:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so590147585a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462880; x=1796067680; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=cBE6o4Lt4xppmy0GPqKi2JvTcoEbAonJquPXBooVVOzxyc7C/ck/LkmTR80fAU0GD+
         0roTKll3tHevBmF0XBgGanGGZGUCo//3HJswxHien+WlI6hXX6SBAa2ggoYFLRazrojY
         0o/MsmsIJ9eHgpICAyFLiuv51kqRc+vS8YlaopZRl9blSgh03jeAS+seu/m7BwUtevDN
         eBOkoQ5JeGnBM99CWcBuqm8Hp6bE3OCFRy5cHvbrzNP4zgg1a2gndoiMeAbzEeSm+tpN
         l3L0+TDfBLbslcPiZfZ82qkUh6hBhCBaFr1qEyoD6V2fawNXb9nb02bBuJ9+YHIcrrzg
         61MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462880; x=1796067680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUxC6ouspxhWBpss9anyN8/bpVZ3ii1paTC8Jy1Fd2E=;
        b=UlRD4jcp3PCgX8azE8Pzh7zfI4AQtZqdaaY1GDOd4U4sy1XbAcOKfi/qFioN+NcIkH
         T0qCXYKmLQmT45KXECgeMK3Q73vZQk25Nd45ieHLgA1gSCihIDd6J1nt2aZ4BZna6WX9
         Uf7YJzO059PwUBjMKw69WyMuhhPERYiJfPF6eX/7R9HJYfoWZ9b69Liv8eBDMd40ivu4
         nLTIWe7fcg5mSbLVieCcFbwH02ZAhQL7Pek7Gu65vdOahm2JaSJQPIVENc7sD87MKhdr
         wDeoPmPeFyp8g9v1QCcamgS72eqxnFE0rh5Xu7HuZvhrXbYxl6pv62BG7JiIbYDX8s4Z
         aGCw==
X-Forwarded-Encrypted: i=1; AL+hErGF51KYExuBKmfXnr67DW0xxaZvzKSrXEVi8ZPyIzYLbLntoUQ8yEyhZa5E/C4zG6rE+s8aRt1w8n6OUfv+bYGi@lists.infradead.org
X-Gm-Message-State: APuU4Z+gCu3Io9nVBKGYZSYLLa5Us6zrZC8cADJzKgDJDvtzQgB1SR7h
	94ybBtfgVd6Hg+XfKwtDlZMT4Ii6lAq1WXv7b3u6/AG22eIYNHC2C6mCjmPNNjYtbxhD1g9Ke0z
	m2JSqfGYRVz6MEHTTTU+Yvfo22mf0wmv26bhlUKyrMPB2CD7KceziqdHKsV3UjVUxEmWvR9GJI0
	A5Vw==
X-Gm-Gg: AZFdTZcoLI6B4nxOeJM1hRUGjQ8nBc6zkQ0fnCgMcUhuSqIWQiH6dCdCruX8tUiDU8V
	N2pPJ2tqDj9NxxXQEYLF8YzOIEaH6BVcTp23XJqMpzznYC248PRn+r3PKKoeBSu7uGOoq5hSe1b
	FmR/uxoQfLkdRcIdCWMLPwoAWpxCn1WSsF+EXV5+55pPKnUmgTT9u5/+xGyHfk24VzNz+35MYRD
	xjhZ1uRI0eMJ3jfG/T50OBNu7XGGYp/4lAa/pEtRkpFhJl+NLQHN8Ao+9xSdajErUBXqaPbzMJi
	ktfiWWMs1ItZXZ+OlbRjdo8VSlz/wIMdpBVNE6MgDZ4lp3T1IwMoFdTFqeSXmy4YQS2QMSmXB53
	KcUBu7ShmlNfGj78mIerhla8dcwA4ZAe6Zh/Pwjy4O6EqwQYsyctzB3slw3+O2WRT
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832793885a.3.1795462879626;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
X-Received: by 2002:a05:620a:3914:b0:949:7acd:3c43 with SMTP id af79cd13be357-949ba7cbbf8mr1832790585a.3.1795462879048;
        Mon, 23 Nov 2026 11:41:19 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm23327384f8f.20.2026.11.23.11.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:41:18 -0800 (PST)
Date: Mon, 23 Nov 2026 21:41:16 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <ytqrakhhpmy6zdsdpqglpkm657ymg35xuhnmukifcwzowdokqg@2c3dewjxefcm>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXxVVollHPbZHU
 IAZyGQjDcdUyWmjNapaNF0VciMO98SkXNCBrgA3RfPtazoECaOkyD9csXe3zytoAlX7sxuCeYhB
 xqZ5LYjZNuIypuGuuDlmRC8aG+Ui3Bk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwktsf5BYtMZA
 sekuR6LlZ1/5n+xX5mOvoo3cznE4ON92RZUEZ/zME/fmyfdXUYXMNHuPo7XwSd5R/2rbv/Glk/o
 5K9RyugM2bzNR4dmX0DGIVYinvCYtns3atc9N6WcLariUenBBNXHzCGFiNdGZpVKjzg48ZErz2t
 LBpbDMIWuP6HHt9x1WnfpOu06AX5AZFD1emrwdasYSAm/ziN5nkqkdiXcD0I4Wa0T099Xl75/Gu
 hak8vrPCqmJ4apepfrvtqydWjXvbuQr68WHTuyl5jTpmu9P10LCqsN9+KOtkMqdbn6rpYe+p7+t
 BkWEq6qbqSR5ak6iir6lvl1jXo5EUDnjCMcubpwh8xVIPxbZ9qRLdXNJSZxpg5hS6byJAajr1/l
 Lq7hOcmmU3M9olx4PYG+pidxluh9KOjryB10sR8iIjaLNQmCrfNiySPwNkNPNOguBsZYDI5pWfW
 hclEvlkjgu/o9EAWqlA==
X-Proofpoint-ORIG-GUID: 5GzYPZEVGQVqyivObCHZqrbByLLL--iz
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0496e0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=jAy75CqWmSRsgNc4pWAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5GzYPZEVGQVqyivObCHZqrbByLLL--iz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114121_427737_0A4D3CED 
X-CRM114-Status: GOOD (  12.20  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26-11-20 19:11:44, Bibek Kumar Patro wrote:
> On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
> dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
> interconnect bandwidth vote, the GEM_NOC path to DDR can be left
> unvoted during sleep/wakeup transitions, causing intermittent SMMU
> register access failures.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

