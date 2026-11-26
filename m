Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD927606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wGv1BXL/;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrjLyzQb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+uh2V/J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=; b=wGv1BXL/PL+Lxw
	6kEC/oxM0U1HHoX4lmWiexxSGVNqpjEBTBf6CKh2H42cnBVvlYamGDIhxg6VAzCXYOEmG9pnhd0dX
	LerZck8e5cp/yUA/5L6VnVhpWK6CKkUoDCv4WfFoEw+Zx1Xo8scjEtjnxeqUANL3IeQQfO5UcUT8A
	2uNy4WmCADfsnV1XkNJXejwd3XVLF94yehg9jPDsmueyZ5zpDTMSCaoYHC9yn9Q8sxNsr/vz9AmaP
	b4N/22TNxI9i4bYrQHlsoTe0qnbrU1zoP8RQJ7v/TLFPYou4jnssGS7Ys2CatsnqtdLFe+Qs2WkKV
	3LFZZ8Hpe+ibqLv9BjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaC1-0000000DTr2-06n9;
	Thu, 26 Nov 2026 14:11:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaBu-0000000DToe-47Yd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 14:11:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVZ1P2911991
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=; b=YrjLyzQbPQuqAF13
	fLqFZi0YYUDLach/z+WWj8mJg/W+n5athvKnEyI9CHfbsjKmmOqTqaXzkk80+iCG
	rTweA0qcoZvgRjLPgMoQL6kxZR3/yYbTtYTv6Vopyox86SWAcbW3ZAa6iuByCBhz
	c0WVYOZZTeKEZtyqLjd40ceb3chelKE4TlGObJXbtCgrn0C1Jz1ryuQU5ZeVKwd1
	6+edBF/CTISzVEEy4qaflp02Ji+Ogm74MuZaNRK+KX+hnfT/OMHUivSNdEnEuUTN
	vLPbK3Sd9YEqLhAIaIW798IJxrObK6Wlp5yJCbEQCaSU7JHBVEFiLN5ai/L4uT4F
	jSxj0g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak02jvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 14:11:13 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b50256700cso98729927b3.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 06:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702273; x=1796307073; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=W+uh2V/JwqOsh6RLW7jUiyLWA3b3rEbfjcUg0uE/4FBKfNXvCpTqdhwCjs1Tub6J2d
         5CQFLmHDbcJEy0AHgyCSNaBba+9V4E1et5YBhdJ0hQJsnuQn8UdejB9LMKgnZuOdR6zO
         wB8UcyZW8WhW8q+U14TX5aHxT4aM3khHfIRSwVjdOTrU1xMA01C+hokS4YtavCHjm17R
         DNeZbCtn17aJhRoaGkuxK+DGpDzAwbeZ3WDa8vk1bue0ISD5YAM+RQmreBWnJ2giF/iZ
         pOegTQnj0Nky4URI4WmZ72/OnxsXSxYmLOTt8eJ4/hiMZEDl8oVx+VHltupiwMcsIxKr
         l0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702273; x=1796307073;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=fVGMp3rAN71+wyv0yuy6IXoGu//hwWBa7gYQdrSgD5WSZODkzxxgmecUwuW1ZhSai0
         RmGXCWPtfItSp+PEIV1Fohgez/FID9HLRDJFLrWKysbx6oWPFBMDT3fTBhuigrQB5ute
         CFhq5m57uO9a91cQLaqLgN7IU2txX4qNH9eT+KiTydGFJl9rE2cY4HD4bSzc1jcd7KGZ
         HTzKTAGE2PGV+ZNPCmQUEhL9OS7YZ07lxtfJxURQ82/gkLIa3Cl9ujP2S1Acr/nUHYlt
         g5XTdrCGb93DhuIzEIXYB6GDpjzy7AcKYMEG4CVhLk+3qLV1our/2pMN4r4iJSi+GnS0
         wISQ==
X-Forwarded-Encrypted: i=1; AL+hErEFWDxGq7jjfw5EBdtUnMbQZFqJLffc6x3t/38alCmLua/JhJZFjZ10KTZB0eSJm+W7aHWh6W+PDm5XBoDhIpc5@lists.infradead.org
X-Gm-Message-State: APuU4Z9ApZGt2cU3deoLw5TOvOSDo9NrbU1nVhB0Qec/ULvnSfgl9nah
	7H2SwdkWwWGSlfC8Qjae9wpqfN1arVRNxhjBo8N489WsnJkFLG6/l9xErteENcVKy309Q2TpP/X
	Kmbk5QLRSwjOh/ZB+8i7g/7sugerMyH+pcbaIhl6eO2MWSgej9PvzrrOFP1WeFNnikCHLdhrsRw
	RQ4w==
X-Gm-Gg: AZFdTZdeGeLfV+n7046zsvwHV24feH55YOQJ9wt91FEUOAQlRlYtG1w1nknmhslZBgZ
	Lv83kAvq2dOiqngE3e4iihD124RKsP2t95Af+Zh2wYhjdw7OF3kPkcuiTh9Pht0wGeIYfuDxYaD
	oauGHTpzGlc83mYVH/JHvLBs0PZJvHSlXWpJKKDghzYwd89zO/RZbcINKsgyMT5ratG1SGLlTqY
	s7sRam3Na1ZFE0rVlxetOdA7udOzk0ubxPjGHblk9Of5NNicQZzknh0tbz5G/0kx36VrkUWzD1Q
	7ajCpYmnUzjAMmKV15DunDOczhxfiOoUxzWMaHZ/nMgvhPNoArxtUGh8bCjsg7F93W91q/pvc7w
	QfEWDfbT6kyG4vdQBw5v5zNbYHcg3o6SMsRlEkliEk5ZHMz5F0fq0f/uqgqxxQfyJSctsaHT4hT
	DpwDkVaojK7pwisyofoekJ7YV+DB45Z5DPD/npw/iufcj5DWhSb2iircoKL1YCmw==
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918307b3.63.1795702272491;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918127b3.63.1795702272013;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42005648f8f.2.2026.11.26.06.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:11:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: aspeed: Fix potential coprocessor bank map leak
Date: Thu, 26 Nov 2026 15:11:09 +0100
Message-ID: <179570226688.21819.14587859111511548697.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
References: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b083e01 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TMjF35BhI2Zkm1y86xwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: W1McEAYSRURvg7LvJYk_I4N9IUGlSgdV
X-Proofpoint-GUID: W1McEAYSRURvg7LvJYk_I4N9IUGlSgdV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX1d4GidBwBUrl
 7whDbJopXLM8bSnqYTYVrRola1QEiVwX5xXpwTjuCf96L6j2JS7k5b87cNB5siVU3BVe6cnlpOm
 /E4Y/nKg21uArvTtBdzHHVocKTNM8b6OqaZtrO7JDsdJE0A5gk6ey44F6tDX5Zg/DJR+tVHgH1x
 cPmwjB9o7Si5+V/h2OFu0wUl7LpK8PXv5HuTHYIBOscbyfCkjbeIP/stXMNv8+Y1WQYXn5wZZ+s
 STi4favH4Aqt+ZNX6XSuMXXIJI3asxwOtWkUkxxdiQsGb5S8SQTEZUZk1fVchla7rXA/G5QSVU0
 AFrQ9BMjdFJQpSk7xMXMnPTNljs81iz4PF5D/uj3OoEuVG+Tnjc+0k7eSBbJNMeMQVL/spS1XnN
 8dofhG2CwKPn2EAvR0EYKg1uYA/GSxlnWs6vXkB6d4mVqUbz3av3MeFmyXiiDP+0KLbNdi9B2rC
 PsnptbAz0555WzilMhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX60pesy6SWZrz
 I5joLkU6uJEZlDvHXqLNDzJIEx/B0F3p9RuNpAi7Au9hqxPHm6GjmzL+R5Rba7qY1NZaz+q1Jfs
 i0Y2R6Xe4x3b/TkQXL9Y2JCdXFSm20U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_061115_161020_72BD34D9 
X-CRM114-Status: GOOD (  12.13  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 24 Nov 2026 21:58:32 +0800, Guangshuo Li wrote:
> The coprocessor bank map is allocated lazily but is never freed when
> the GPIO controller is removed. Its only owner is the device-managed
> GPIO private data.
> 
> Allocate the map with the controller's managed resources before
> registering the GPIO chip, so chip removal finishes before the map
> is freed. Round up the bank count to cover a partial last bank.
> 
> [...]

Applied, thanks!

[1/1] gpio: aspeed: Fix potential coprocessor bank map leak
      https://git.kernel.org/brgl/c/f18a4698b0124f77549c23600fa5105bac2951f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

