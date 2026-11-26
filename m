Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F6606A690
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SYt4zXCJ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuTiIGuk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYXEOBcb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=; b=SYt4zXCJE8oN3H
	j8dD+rCFQq1ldwHrHxOn9f0wpjgsJdSwjn1fNdCyFk+dyR/tgbblK7D/tlorvf4w1IhxESjjaeCR0
	dNeFobc40+cjk9ZAfxLN8jKYdNsWVW0LO8zzV3XGOVVFded9CuM1bA5FDFVGUgh+HJYcPvcKgoxzZ
	W9k6cbHCoj/DPRJo1oGKxNcH+ST3g9rleVhy6NItD5MBHKau37cSc6oW0atSSwrkfTdycOtu7O1KW
	o7dpVBxRyNYry8CNWP6K18hXJbLkO8Zi9lPHFsJqkJwNKx4iXQ/Fqm3sXopeGupNK4NsSpm2qDqUC
	/R8QD5uXW8FEHYkQzdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUVS-0000000CLeS-1QL8;
	Thu, 26 Nov 2026 08:07:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUVO-0000000CLdr-49Mn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:07:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BI5t3315348
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=; b=cuTiIGukxXzABDFq
	jqGVYJsu0iutdk+Aa6KvmZuc0na2hHus0NXjieEI2uymsQsFayLc+UEn2Gq1OA/s
	sdNInMq9wfq6081GHTNTicfbLgYlVLDjnr+q7nElF7hoFnmuVYxn7c71tk1MXwA2
	umispOJGej+tL6KnYZcx/bRG2Cclgt7WYRUn7WFF+3CicgoQLPSLQhhFMi0oH9lI
	xtptUzDZRGpCe0WOmX3s8MaSlLNJUxJOYNNuPJhLuh+bv4kLdF6kJWGNmcfmjKpy
	3em34HXZB0x2cFpDQ+DhqplC+xYKb9FfRw/S28Rf133ijOYCYRx40PGmMDCcdwFs
	ewBrJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvhpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:06:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9212747f4a4so6663436d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680417; x=1796285217; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=PYXEOBcb8eFdxzePnElSGSL0eUm05d4pDDPxwzMl2fOXM5r98T+Btfq2b5aJtAZIkB
         zccVEPN+GjxSza1LI/zjkXdsi2O0oCj2sDFQ11iNLFKvU9x7Wg1UTmteu6/GhvenaofK
         7dx5sCRBc/jJFIuO+ctm/Xw4p/Mc32s2PjSmXHt/rDLeodNt3Flxjd3pbMC3P0elIfUX
         wDOC2NSb+cCXv99+k/3Aaa745bU3xu55RCzvGoHqr9suWoFZ411fKvlc8Bdjslu5IBLB
         pWzZOwbW0flI1vzwKLseI2h6p8lyQscHN4ZYZwAJ+t3scKv8p2RmjLZc9YRnUSEUo4Lw
         +rxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680417; x=1796285217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vumh80GJRKdbHq30HgXUCrjxnTICP5w9ABeiQiy4sN4=;
        b=qmbTf8SgF1nhQWCUtrz++Ar51NIGtk4FhZ4r7xYnhqk+IkeowD51Wiy37ve1S6P66G
         43eCTb6+pBXWq81df/BkyLTMzNAI0ivzfS1+7tSda2pMytT/ASnc+B6jNq/3Lu5F+nZD
         abhRJdCW5i3AlCG09moo0mEls+Pv/0qN+VYpejJsIbx8k4QB3lkxeYNZ9rYyUcjfiCO+
         LxCH7kTmm+Y/uH2pkEJpnpMzx4mszCQQ6YFuAXO7ysS4YeCyGCNXw+Od1huuowDy4LUF
         SyTbSduCEkeB+BzWA/y3tvqvWOFXOfg2XQBD8fY1XY9qs5/Mfk/+8Pk9x3yYXASsAR3c
         mzDQ==
X-Forwarded-Encrypted: i=1; AL+hErEo23LaXruWE/AsL8dMgVcJAEnpfxgxIqF1r+DRlKGdZ2jh6mMBo+ELeCq4t2JhkqhujWIiJesU7Hq/KPwUSBeA@lists.infradead.org
X-Gm-Message-State: APuU4Z8TDoRe5KMvExYCBjVZ88h49o36DPNp6y3Lk95aBcpBKrhtA/cx
	+aUbqFCl1F4G7ePcbTOju0TTgkvk9ggwILHR3R+js0Wmovf6P9ivSNbf9Mp5znNlYZWB1suwfnw
	ZigEjhjw74vu50YKfFMZg0+2tVF+sS2LgFBM6v/5enmPRETrVYJsqoKjkbo7UjBrZZq9l7kcELz
	7Rtw==
X-Gm-Gg: AZFdTZc8446zYEFWfl1MoWbldmoj58gHTO7elSNgjAd2BLFpmHcF8LA+Zc1AZ+6MMki
	Ip9W1vVTZhriOxBxSIKcCKToE/WKE2p988CJiFnSES4WqCxE6JCmBLZfTK9TJslQqIL1VHPgzwi
	ELwbpJNBFBtVobk/5MfcqAXLoz2fBzxfbkymKXmsojnY8QPjchAA5lm7ZbcSrfemvvQ6zuHIaFX
	NUkgXmEqYn01nmV7zTOb3rpNFRCavEgQJqN47yi4mATZ//rjhvXCoeOyv55vVwaAREuMsP3mRXO
	Eu/sX5V1PfJmd2k//TvriAk2RRIBksg2BIhhH5NaOPLNUVhiWvWyEafjwPzcj8GpALweT7cS8KH
	Ty0tU7VA4IsUdXXY39ydmnCjXZ7K6yKiIqiUTRABGFlKOgz9pkqR9oOxogcRFNMTknPEctDI=
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759586d6.0.1795680417004;
        Thu, 26 Nov 2026 00:06:57 -0800 (PST)
X-Received: by 2002:ad4:5ec8:0:b0:921:223a:fb7c with SMTP id 6a1803df08f44-92134773937mr464759006d6.0.1795680416471;
        Thu, 26 Nov 2026 00:06:56 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68887sm743942666b.20.2026.11.26.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:06:55 -0800 (PST)
Message-ID: <9c634c3d-0d74-4ecf-b9e3-180c2d602862@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 09:06:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel test robot <lkp@intel.com>
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX8L+tQ8Ye80QT
 tGI7JBfJ82TmVMMXqLaqpAsxqeJWt5BjnMmvcZeX/A0iWG7B5nU4EuiZIZkEPAUus9lXqybU6ms
 sutCMX01m00tBq05JWH9uNiwOAkU9ozs67LsZJw3+2RyY+ozr/zuFDZByhqYL4w4uTfC6m20avp
 R5QVjuQZ1SbRoWRabt/A4ypM2aEwNwFNXzeqFjl2YhqwWZVUAxH651ta/Iuesf89K00GGB/FnK3
 KqvadNUW2fiCDeGc7lfyidy4N7sTI3jgHrM+pjyWa03e0knxD0CbILoxFggWkkxba9CtPoCn6+5
 mKQ4OksGLl3cTe64uem781u6QcBtgwhnpqWmbHePbX9hLDcB9/SVBFcTOLKKfaIM6Fmxzhpr8uE
 4Qyq+wWYi6f9IX+N0ShK0HGIKkhcJXiIxOHxhntNHps9yiAApx1a9m1IWbYdyReo/cMCq5NzjxF
 jkQ88Q4+QngYM0o+IuQ==
X-Proofpoint-ORIG-GUID: -i1kSzjBuP0y1BxmzgEmZb_GzmYjuaH2
X-Proofpoint-GUID: -i1kSzjBuP0y1BxmzgEmZb_GzmYjuaH2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX0ZF5q3mWf2wZ
 Gdzsjmjo+4Orztm5wSYevwPj9rSujcwriiK6LOb9rCgaMZzJ72eeCs7qjaC5o2jnj4CuB0z53fy
 tBfVvnR4mWSZZ9DbyQqqeB8xZ0yfy+g=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07e8a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=QI7CjI1Wg2L04FBskPYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_000659_167775_66A36490 
X-CRM114-Status: GOOD (  15.09  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/11/26 5:15 PM, Hardeep Sharma wrote:
> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=1:
> 
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
> 
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg = <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
> 
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno SoC")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

