Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A50606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lW9WbsIX;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nVOlxK41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vmYG2CzA56D42MyndsHp83p6siaKz1u7RqN4C013/tY=; b=lW9WbsIXZ+4OFh
	0j7fepP4+jNwfqOU5DUMaqyY4YP7zPe2jcZ5cPH/I15D3CxzWb8zqQ2zCuZwYUaVCWi5UtRKjBBCm
	q3rc1CGFLRvUY+0M5bRfaKNYpQ1Z0zAuN8WX5V0Fss3jx1QSUj9ufUQLC6+sLTbm3GJ3g51sIxfN8
	4ZS08DWJiArQ31SQETBS2YAjicjDAdyxIi/Ho3XrYDGWrUHGs+Iw85xTvsa16nJnEy3TqQk7V9A9I
	LIUyouL9mbXGye6cdaAGx3yg3p4anc1gmrdJeJVgUEUL7Ar+n531qqI4j6arIhGLLiBJdzW6gt8p3
	/NP0DBwmE1Om4M0/d+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQiN-0000000FSOt-3fEE;
	Fri, 20 Nov 2026 15:39:51 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQiL-0000000FSOL-1Rga
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:39:50 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEuWlh3423804;
	Fri, 20 Nov 2026 15:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vmYG2C
	zA56D42MyndsHp83p6siaKz1u7RqN4C013/tY=; b=nVOlxK4104buOQHMGgDEQT
	+CS8pim7LGlwSOMkHe4CJro/72TxbBfSjy0gBO7OXxBrn6h3xKo0qdnRwREDrvCe
	Ij33Dfr2noKC2ah5OJg6R5ZyRwxFohMM52EKyIqJmhFplCWDrLdprWdrVyAlzJ9X
	hkh9Soe1Z/ge1JqRifFVUp/PRu0CUHs8nAgLEu4v2RCV4h0Engq1MQTQFEFelCzn
	p5UkmA8td1bZWPSqVL2HEfJEpK7yvR6IXLVypCYMQY5L4fYMKJ5tmbrbS/2Tlvda
	CDwyYiqejG9U9ahhj9j3OpWd2yxznk2dlllML9E4Lbc1CBHh+HeN5qoTALynRGwA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105w1428-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 15:39:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEnuK22445442;
	Fri, 20 Nov 2026 15:39:28 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1m3j2xac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 15:39:28 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AKFdSiD26280638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 15:39:28 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F51E5805A;
	Fri, 20 Nov 2026 15:39:28 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CF9758054;
	Fri, 20 Nov 2026 15:39:27 +0000 (GMT)
Received: from [9.61.14.72] (unknown [9.61.14.72])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 15:39:27 +0000 (GMT)
Message-ID: <84bb623a-151e-4f6d-ba6a-a303838f4aa7@linux.ibm.com>
Date: Fri, 20 Nov 2026 09:39:27 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai
 <billy_tsai@aspeedtech.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-fsi@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EWHHhtBzh0nmcbaMz1EfwNJyLAH-95S_
X-Authority-Analysis: v=2.4 cv=HL9WhYtv c=1 sm=1 tr=0 ts=6b0069b1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=EUspDBNiAAAA:8 a=zmo_udYM6pYQbqL80pAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: EWHHhtBzh0nmcbaMz1EfwNJyLAH-95S_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX60wzkTj5rCZJ
 Axp/ATwXoOVTf231ZzOlUdUiZUAlIBZdfQMOAmGfXQ2dvcsy/YBaJUqo0K8t9mOl5+JrO33w1w8
 Y9ZCfqsKSN7Bj877H0NzJ53ypLiU5RqWwIrfY1v/tbJR41icFDyGWQy2Gektlxz/v8rlX3mb4Gt
 fdRVL3dhNMKnB8DmOuOVDRAN4YAk7HqhhPrDDMFi0XTZ5eAB/2Ela0EmGRZ88Z3zQ/IZJEC4D9D
 Mn3/9qR9vEzdHuqEfB4yqzRlFBXWLSfYR1CRpdlHzfujRynLiR5//oRn9mS4Y11dRs4MFM/cXDJ
 JG76PmEvIt1C0AcJ6LCf2MYFifVvu6ZA4FKm0vOeMkrUvU7PwyeHNerinxPq2aNYTcKpGCBa2O5
 Eh2XKt3yh8lvYSNwmRaTQ6SwxiNCbxv/HRl1NRdYpx270DCbBAOXKMf+Hk3K2JQMUSC+njqOJDG
 Pzm52nkbQ0wkQ2zMEug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2MSBTYWx0ZWRfX9eGEl6ytv4s7
 wRpaigFbRZJwJrVgeVPYOcNynpR7TXt1RMCqBZsHVJeMNhIOPpy+SZcgBlLayV1NIs4pWoaEBLw
 fj0J252ZWU7AYhsJue5whGe9rcUf3tA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_073949_559658_11212725 
X-CRM114-Status: GOOD (  20.15  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/3/26 7:20 AM, Bartosz Golaszewski wrote:
> There are no users that share fsi-routing-gpios in any of the upstream
> DT sources. Even if there were, the right thing to do would be enable
> HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
> of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
> flag is now deprecated and will be removed.


Thanks!

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/fsi/fsi-master-aspeed.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index aa1380cdff338dfef7caa8d516322e6bf90371cd..88a3a90abef9cd22cae03f5666936ef7eced8a7d 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -496,8 +496,7 @@ static int tacoma_cabled_fsi_fixup(struct device *dev)
>   	 * The routing GPIO is a jumper indicating we should mux for the
>   	 * externally connected FSI cable.
>   	 */
> -	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
> -			GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
> +	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing", GPIOD_IN);
>   	if (IS_ERR(routing_gpio))
>   		return PTR_ERR(routing_gpio);
>   	if (!routing_gpio)
>
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> change-id: 20261103-fsi-aspeed-gpio-nonexclusive-3dda6d175968
>
> Best regards,

