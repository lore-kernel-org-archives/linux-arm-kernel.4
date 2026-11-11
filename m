Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E171606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ueG5m1VR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAut/Nxf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W2sXK6fi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=; b=ueG5m1VRU5jZM/0AxyDJ9koeUy
	MS3hrxAMJsTXVfcecOlw0EJ/Pk5a3CDsJABVAXHVkByEuL2DTW5hy5V3ca6k8fVoKe1/u+zQvOZAm
	i51sU5MVVA3zdLvP6s06N9MLZhvHp3WmX3E2d0o8fcQKOo6LqpwMO3G9FN7TcvqQJiILDEVJh+6Uf
	WQ13MhFmcs5d8AWUJmKwPsTfrPuYEXgztyijNmq5n52b+9ECiFEKVlWeTwjkR+DlMBl3laAlgBe4G
	CWFFI4UEiCt3xCITYR62SfoeKcwGtAhU91kfyjLC1pr9W1SQ4uVIab+4sEKdlZmshE27T9Bcwsmum
	w3EZDYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7mw-00000006izj-1Nwc;
	Wed, 11 Nov 2026 12:50:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7mq-00000006ix4-3v8v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:50:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ0PT300537
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4FAs0nc2V9j03oi2Af+IjyvF
	XtGq65JBcvLZ3pfXJ5Y=; b=jAut/NxfJeA/8ljpv9kMZOwZo/gqKe1bCZwWZdq3
	6jTwbxeis7BbslY0uehxTMJaGi1ElOKX+bIWTf3U+aXRoADWuQWGXPTDINEiQJ0N
	fkHQxvDzleaHm8iWWip5FGXVIMvQTAB59aJ/oDQG1GJgrxcUcqNc7B5kwgOysE5i
	5DaGrpN1akMzPd16hD4eBe2lnlt8Uc83EZKGe6RDjbMgGqq8pBlu98MDmrYxRD1/
	opybjgaDwB5ZT8NwXYl5wJ8mNh+km+SpWJZ0ZznxyfsVqkzKwjJzs19RllA1ZGoe
	diAB9Xh0QeBInrpS9qR6yNsxr53DZd1NUs72FPbqgNXRug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjrhxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 12:50:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9440b27c1feso508141985a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401447; x=1795006247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=;
        b=W2sXK6fir6eFT2yAWb8/Fpd4kzL6B2UTkIpSwKchJoRnvXhXT4D9hQDk9dZ6GX+vlD
         TjvmGNVpLUeHzxSS5zfl7Pu3DIcDsjQJfo8BKKBPgWQHg91igcXUq+vsTWqi9saxyphI
         j88e2N4iisH3AWiOkizpl+JZJF92R2M5jTeHBDIGbs5vKwyeFnRC7XrIeiouznVlHQdd
         oLZkKQg03qjIsG63wQUiR4sw3zb+WnWr/Ca7/bgKZmwb8TJGaG42tKij1TIh0XzDpUku
         CqtAcdTXZplDMH8/7eh0QptS1vq2s47YLryUdXbY6X7++gnRIHkSP8S1lQZe2+EX2jbW
         A2iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401447; x=1795006247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=;
        b=nE3ujB05CuVuSnvjhr4LVxoAgPFoKnl8lSVC467e2/Os20U0kJ7fmboMg1N1XjvXKX
         sCmuHid5eHQNFqbJNDtEnRTOXcyaJop+pm8bJiWJVvMDIdp2ZhBIEDZIaJ8icOhx0g/S
         AA3w08y40DLvo8CFnYpcemNG+sfklaacLD0DHqlDQlHeuzbSELfupU3e//VQMrXKTB97
         xJPLw1moLWCgSJ4n+suuQq6O/NAVmF1V4fXU6Ye4nZ8Jv0p3BNFxN/8HCRf8qR2aLk/K
         b9pI7lE1efZbvN3ywH+nuTRI6xOxuYKEjQbAw7SPvRbFQSLVdWZtBYJoZ02/S0G+w/mY
         hHsg==
X-Gm-Message-State: APuU4Z8FBpCc5KC+WyAMLJAyIIDqytyPZ/MJZRF+fEsXfH6Sv94msEan
	3bxqzuj0aBJf6s3XsPLC7JD/1V6RLIoIGjhIdXwOJcYPZB+ztPS0VHTM+yJY/kYCeTm7jgfyTZI
	FUU9m19kUVcr5WfUxRsMeT9lPQ9j5cPsIdrkl2QenWC8K8PyWGv+T/ESamgVJbL3rNr4qCd/WGb
	o/w7g1M9K0AA==
X-Gm-Gg: AYBFou15ZdM3PIahPisaXCgoOjoYek6O9tW2at0x3FZ1HioMAbx0Hz/2DKlU2oBDrJj
	PIlndcuZJcjFMuEJIZRP/mGTwGe7HxOmxtYeJB6sV+BDCsN2z/53CE0SlBdPDUkpOQOaH6/sraL
	AtnNDaKXSLJvX1W9ScM3lqXu1WWcxLPpwY/crG+kOG0vsV9IZCZRUHo8gLQRrB4BRwn3J0/vAoY
	VbVlksXEKEj8pnx/yi7YgeJApMLsKhrAVpLiGc2AOZDeOJVZRFTTGyy0OwAOkSD5ettMlMC08w5
	f0OwLA6Nqx6OTKt9rUh/V/1QDSLb7b3buBjByyAarjmBWziKAnN2FOupVfqiz8Sv2Z+QY89YYH6
	eESM3batzfrZhLBdrnlteJv0vko0j30LEIsBngISmZQDoFMGIXMD4iYBXjxwLu3YIIiX9eeqhsQ
	BM6HjfeAUiI9yzBF8i+J2p1joUAi60DRLm2w+B5+zFvevXuTAHxljfCi/SFb8cHg==
X-Received: by 2002:a05:620a:a195:20b0:947:b201:fad6 with SMTP id af79cd13be357-947b2022f47mr193461385a.68.1794401447253;
        Wed, 11 Nov 2026 04:50:47 -0800 (PST)
X-Received: by 2002:a05:620a:a195:20b0:947:b201:fad6 with SMTP id af79cd13be357-947b2022f47mr193458785a.68.1794401446584;
        Wed, 11 Nov 2026 04:50:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c162d0ee5bsm695e87.66.2026.11.11.04.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:50:45 -0800 (PST)
Date: Wed, 11 Nov 2026 14:50:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
Message-ID: <55cyvfifrnu6jz7otkyrilxged42tbz37oc44hfozuxvpj2lsv@f5lu4agop3bl>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-12-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-12-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX/Wu/TXum8yp2
 mdXUYpdOjILNi/Ih6Fo/0BJah6POPV8muMWtFwOAABzkZLKefBVbKBgiAu78vXHJiBa9TMuZvfH
 lDCWMIxkowbAqgy0f2xlDHSfZtsoPYeQIHXhK3h8sxa+pVJ1ovtzvn31WoBsUi3QjP39dlXX/f5
 OCNFJx4hnu6M2vVCpKSN1+gcqL0OPAf1CnsidaajxCpTtznIR4+uFVuEw+hfeoOJd/8R5JdCjZf
 CKL4atLp5ADJ+02HoYn3dBcPek412QmI6dYRG4zosGTiu12p9+OLPDcuLe2BaNCK3hntTK3Er8/
 ZfhTp7FqJ72K+Q8FiflanrT3WJ5Kvo8OJQds+NrB3WZakE49nvAG6J29cyMb9FD+k9MXXf7BBD4
 Nr13P/udYZRJkgrA96THQ59rSE2IE/emGzfBBlkSP5x3sBy92gGydpIGOkvjNbiUZbBw2RI80aS
 1fW9FIecI+Lo72pP3Ag==
X-Proofpoint-ORIG-GUID: vqwaYQnQL-e8mKiBRlUjC-GSAAFBEaix
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af464a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0S6IfGOmg5uo7OBnLw4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: vqwaYQnQL-e8mKiBRlUjC-GSAAFBEaix
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+uSI4F8VnAbb
 unh1HGlxyx16GTyPdqYYdYfwIYCsqDgNHtstgGqXznq6+P4Um3RblDFgyD+mrMr+VVw/zNn072p
 hvphI/93Sw/wu3R/URjEcg/I71uVWas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045049_106182_B85F5B2A 
X-CRM114-Status: GOOD (  20.47  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 12:53:07PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
> of entering it, and ucsi_yoga_c630 already sets the orientation of the
> combo PHY and passes the EC's DP hotplug events down the bridge chain. All
> that is missing is the DisplayPort controller, which sdm845.dtsi already
> connects to the combo PHY.
> 
> Limit it to two lanes. That is what the PHY provides alongside USB3 in its
> default mode, and it matches pin assignment D, which the EC picked with
> the monitor I tested. Four lanes would need the PHY to be switched to its
> DP only mode, which nothing does on this platform.
> 
> Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
> monitor's USB3 hub working at the same time.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

