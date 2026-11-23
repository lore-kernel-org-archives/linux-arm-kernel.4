Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD738606A684
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWsWpzXn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=in87BECI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i76kYzOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=; b=xWsWpzXnB/ukoGMbQ4XmdMZrgA
	i0cQ7se05q3Wd7K9sf1Vjt4rjcHG3o8WByR5guNUoywGUdgcG1kRbIAwSMlFF1vRltezF7/qFhpgA
	nAYETT/n5/rgAOM4wRDu+zsddDiVj4boGWpiqfXLbhF0ILQNAk7+oNxQsNkAePyJ1Uxw1hgQbVq4w
	3dKW9ysSed34Pooql0uqSaZ04Zm0xDfbFEWZPTxN+s6PpZVTtVsCFWLGBkbRw3UMElNKa4slXpGIX
	z1Ksexim+e5OBv5gRH8dGN414bDdRvhnE4tvF7Sbn7EDCp71K3QO++2Y3X59SlkG3bGXI4FhXb1uz
	fyjhsFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZtN-00000004hpU-2xks;
	Mon, 23 Nov 2026 19:40:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZt0-00000004hYh-0uLi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:39:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH9nf2377537
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=haNVO7gOhf5Ym+jj9U2IyzMe
	C+mkDIqkrVpNRPXkmrU=; b=in87BECI0Pt/FGjGRSYHFDOIJgcNMkkMvbu0rUft
	DqhKb6u4B2ZYJRTDxBc9WD/Zvm0ZaeQ4iYKNhz2DzckJaq72V1QP8O9WFsvTx/Bh
	H9kbwok7Qk8WkJRlkini1eybC70UD5x3qLWr56ftt4+OfxvqrQjWWFKhLLewkIyY
	VC40bA9TDydeNbA+7/zn4SslVwPKq1E6oI2Mb6blc/SB5J6xfY3ecMLcKqyHzX4J
	PLxB7TcTxv2GyskIqpACXevEXNkZp8ZUCDwrEXqKJGfiWbBhlvV8JMqpne2xaHlD
	eSuSAs5vXrkJWTnp7Lzy1pPDv2kABXG6A79WJzgClOAyJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut458-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:39:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so738326585a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462773; x=1796067573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=i76kYzOl3AHcfkEQUsLv95DcYLcyKzVZKXzrnyA28kFDwkyRwdEthV/6lXPozDvohF
         yQ6tgCcfVvYaY3SSsdKm+oVdjWs5pqVwdPC4cAYtuTeRgY6Y2JZI2RxujRTRUB/SV/Lf
         /F365BLJ/gaT9O6GICGVWVZ3ZA6mJ0Qq1TYn0ayCujukDV5uaM7i3qJcAB1acyONYpth
         P0a6JNG6DbBQyveO3YU+9GeR/iGz204sB0EoT47WQ2aW0OUc+U1PWXUQ9Iy1G3x/6wls
         l3L7YgcaQeVjYX9D2+GFgOGXHae5msRut/FqPKloW16uVlPejKXmqSZa4IXDLrAz4Oos
         yOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462773; x=1796067573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haNVO7gOhf5Ym+jj9U2IyzMeC+mkDIqkrVpNRPXkmrU=;
        b=l0l6huiqeJsCfqIRGhxPT+slBVBgER0sIkQ+/io0TZNHS+JEjtyN639DtFWr+3s5+r
         geUb6/DRnooniCI1svQ2ZnvgXmPIAM5loT57ZBVUL0nZssChCWkg7YAGLK3++HsVafx3
         118xzxuAfbviRRE9hjIRwOXA/ODIC5OK1A71TWZT6gv0UwNmU4rie2+pm8RFy7UsX85B
         1QPQkgvnveTjv7oTUqXz999aua24FSdKl6cZVgZhaB/xzW/SucoO8xOnDK4o5rAnMIvi
         +uhGt/s/UMdkfKn+g6alJh9rjeKJ+1dsZfDr2On2LsWNCG0WwBk2X5CKzNYsC0A333PI
         UzTQ==
X-Forwarded-Encrypted: i=1; AL+hErFZxiux0VK/FQu4giTSYTyYaYaLODYgx4han5pLDf/vhLH9rVAsa9a5hZXJ1sQ+r0m2SLvo1YcQIetmEgePZ/xR@lists.infradead.org
X-Gm-Message-State: APuU4Z8s5hwX/KNGAWNOHY65+1VARqjWczvEjzdllhGj0ZxwWcYTrWu3
	TuPBOcXlfBKQBnZWvGqNbVy7SSQhb1p6PI714wj8+6gfEZmUiLYAnbmZ/Lcz3l9sc3fTqbylhhW
	INocgr7Tv6Vv537YmrXbFlm2Afdesvd8vfBN7CUTcjW6c1m+fKxP01GqcgBkrnL4lNWZFR9Wm/g
	jPWA==
X-Gm-Gg: AZFdTZe91k+FXDlvZNz52AcOdn5LCAzRmpw0G3Au1VPYT9XU0VBjJF4tnN/WZpt/bBi
	tecn++jwWrzflt1LpUkW0/rHGxnz8V4/NKEU0owGBhYtoOQ18fxBnOorJbHRGOPM4OZMpUZ91aW
	YHxQ7v5Ww4J4OltahuXOUjv4GczFj5qeqCVVhD+9HKqSyjLyYUadOkBHOrhf6sheCnOQAZ0wqcX
	yz4dHcYXk52sRWl0uIOjAPKAEaSfRJy1YSX72Kxk6tsGKCmDbXLrterSCW36LNtqhPbow1emGac
	zIlSJz37ig9yvBZepzOZPACxFxnJwMjiRJA/yZtP2UdXYZfBkDP+DRcPuemRo12oYzJktrGNYWU
	2UoZbnCVQvqfLG7bpi7S7tpIJIcXoKAJqJobnOkxiC3PlYrviGNnPuZzDI9d/10Wo
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181775485a.47.1795462772468;
        Mon, 23 Nov 2026 11:39:32 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:949:7750:6bd1 with SMTP id af79cd13be357-949ba9c26cemr2181767885a.47.1795462771705;
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm550971745e9.13.2026.11.23.11.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:39:31 -0800 (PST)
Date: Mon, 23 Nov 2026 21:39:29 +0200
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
Subject: Re: [PATCH RESEND v4 06/20] arm64: dts: qcom: talos: Add GEM_NOC
 interconnect for adreno SMMU
Message-ID: <frzrzvk6blfodotve5lndlqj23qpefqzedq4qeafv6o6fsayad@7o4bskhjiun4>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
 <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-smmu_interconnect_addition-v4-6-be30526391d9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: qzTdS-FN-ETqYl5eqvubrQf0CvaE8ps3
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b049675 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=PLo3hsA5cR1DE-V2qI0A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: qzTdS-FN-ETqYl5eqvubrQf0CvaE8ps3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfXwzQnLHs30Udo
 m9OIoXPkVhmxxtfYYDnOExYEd4FXCw/oZdlLLioSYJjf6qVTefbSceJd6UiHEksXOqRoA9vr3fw
 No2mZjTss0wtPKnLPZP69kz6JkAoqU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OCBTYWx0ZWRfX8rlyv6FPZ5lj
 kC57w2sTLpzQO/cYCFT+aPFvfzRyBSNwWUOOT56ZkLjcLX0bv/o+YKlbeDXW9I/6MNlrJy1lb2r
 S6hUM88oYWXAi1K+d4NQ6/s3P1Ca125NAoc2AVnL/MZv0cTJISJIIJaVqVGkA4wMgvQJWYUgOrb
 kU89ytL8iHPs1U/9n9403znvaUYGg+0hMDy4MVvEvvTGyUStZqgZHw7Y/3XIigfJ5tc26e0P1IF
 flV7lmN20VPndZUk/6319Gk9K5i68ps5hl24dOm6UYXCyP+mxsndZ+U0lLGmQ+SIvFh+OQ83Yw+
 x7X9NgR/dfU59ttpWBa1qx98jO/2l9/q5XAAfi3+MFV73TcjnPysRSJiKOjt9QCqkMAlbpOmduM
 nJ5UEYMkGvb3zFX3xyZ0eOXH2Yv/ih8KNdqL8dlTnzzEBcS0sNInBYpATrhFHX4+WdGyNnYE6Fy
 zFZUI/UpfidAHTmdCvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113936_065337_435A388F 
X-CRM114-Status: GOOD (  11.89  )
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

On 26-11-20 19:11:37, Bibek Kumar Patro wrote:
> On Talos platforms, the Adreno SMMU requires a bandwidth vote on
> the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
> are accessible. Without this vote, the SMMU may become unreachable,
> leading to intermittent probe failures and runtime issues.
> 
> Add the required interconnect to ensure reliable register access.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

