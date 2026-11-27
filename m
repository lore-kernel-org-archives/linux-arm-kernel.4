Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3604606B192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pNMHhk5V;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F9pxprWn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FT6V3ISw;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IkmslbzU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=; b=pNMHhk5VHpw/+z
	0iqfSZDNR1LfQyzxtAQkmIfwBDLPEu3jVaD/IhhY2PMphepZMxnqb8sXx+5/FyBMvWAcJtJwDtljA
	JI/MRkbu7n+vw1i+apesD4rcynFfu/ZyJWHUd+u1BsBEPjrtSkW9rhrkzUpk/5OejvBJ7V1bZGo39
	bAhIms50JLc42wL7GdOtXERrtmzes2ZYfHX/UJ/bO+JVTcnMf1SqnoNoXj8hW6T87o1Fc/7zklDeC
	SNMprM67/CxpSanwnmf6S+cso9A3ACxXnqiRginiY5KNORyuflP5W+Lko0rOgdNsOcezljmy5yUC2
	Y2+i5GMvIqZg76EALZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwxj-0000000GX5E-0Mxt;
	Fri, 27 Nov 2026 14:30:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWww4-0000000GVGo-38rP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 14:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=; b=F9pxprWnzQQW5Q6ExOkCbsbR0q
	n8WFyPmBWogg0VqxOBvhucP8F5fSDjabOf8cNRFuMz/Xyt7zkj/BDtbcT0rPZGkEgvXf+wAmifsr0
	8XVXVkG5iFacreT+ReZ/eruA1eNFVNxQ0Lss3M2yX2P6xkGCr7HCDuIIPY6X9E62Vrb1hW/w69Mku
	0E++ekZS7KMu/Or/AqUW2cG2WJ8roHURTyHSbJzvrj3aW4RwdxiP3kT5u0XhpZOMTPrQkUZRdpSTu
	eG5b0MiiCGZCzR7qvxW5Ex76mWe0yRBELnB+Si+LRjtZtKkc0W++YuG2RjhyOGpU2AyrOudNkJqcg
	wdfXyBhQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwvy-00000007oVw-1N9C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:28:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1Kp4685982
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=; b=FT6V3ISwho7TB3xG
	Ot2TUIo3oSf+gwR1jBpMy/ued7gfsJg0I/1JscNk2aMhLM1fRNKAxFbW9YozIFLd
	dz/Yogx7ez8nxyY+heDuCRx/HZrsoT/OEH4kQ0IfH0mTIoVBD2RDTR+Hx6YrYbmX
	X55HYqvAzSUe3Cw1EHOp3bQDWUZnp/vskiAfBgHNzyvtZTfeXrn6nutkzVCJGtaN
	f+3QAntl56q9YtecV5nPzNn5TG0KgfaBOxeHUEKln1pubZ7H1XY/32Yyhn2hDrx9
	0RPvKP2r0QxPg69dRh63xFW8MPIpF+Nk7e46iWtBF31eharAGL2yKPLaSWVl73lC
	3wz0hA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u49bd4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 14:28:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso72745485ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789695; x=1796394495; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=;
        b=IkmslbzUY2WFGBGVuO2IlmAZzyO27Hb1CxhpSGjiftsf19pUID1tH3xB6gyh5FxskF
         ETCD0XXSkQT7BrQOgfi4cok+qm7mAjo24jtG2hAlP5TSzPAz7gSP/whK7JVkfP4hxB4D
         sMyGJt6n6nx74Xs0CavmZzEvUR08PAqQe8ejGNm1qUMiu1bjV5ZRydHXO3Amr9UTPAZJ
         WNjOn36dm7ATnxm7ejZWFxQFL5t3TLlh+9dKOtjj7kGYztFySVwtYUt7Gt+FpmGHzuQ/
         7yhX7yVJnPMtI1m5+KMGZRMbcjViGcvsSBFYIxPO7/AhWuG3or055/ndtV8dgT4kmNMs
         gzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789695; x=1796394495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Ih3EbxC6Y5hylluRnR5nFDr0jXglPTqM1LHqYoKr3w=;
        b=f/nnEIW53nI9PHaOaSFbFzRflHwpWS5IiOStDVc1Md5JLZoulP2DHEW+LMxNfzXIPS
         1rQn4QzSy7szbpXl+15kADQt39VQqcTIipmjlG82zr1q7ZK0TnACbylSPQevc+2Owhfn
         QNnXklCbZtZiMEpLNtaYnvA6ATRjB3B5zV6sfg2JjzWH9U75rj8SUCpudTcqVVHZv0bA
         mOrAoQhj8/x6rFWZgphNQ3QCwETU5EPuEKXZHPe7P+rycHyoeV+n8L+RCc87KCqyUZVs
         5C3BGvfylseQsIVzVEOEDtZRHFKUm9heWyEj5yeMSFdGiSaXy2q7wGcqipmHGr/XBrDC
         RMiw==
X-Forwarded-Encrypted: i=1; AL+hErHWf9BySSxy8JLVN5aXA6H/sdP3Ix4MvMZNtJQjYACBliOsf95jS/0LHfYWaWinX4RMhp41QTKzpCaCV/fsI5ck@lists.infradead.org
X-Gm-Message-State: APuU4Z9aKnrh6DpPg5gfZLZFmOyAV+sZaq4SaFa3Vai/++/v7CKffnxd
	xvWIZHEvr2zqxMuSCoKMRkCeKFhYdC+3HUH1ziHuejoBYXJ00dfxzCl/H0QJsyu4xc3qs63FtWD
	A8frpMNZd3/oktT4gKVgi3SpD/AUqI5ZK9FbztBRmDHPrirMyZQVwn1e48HHCDtn2fglJwQXU89
	1lDw==
X-Gm-Gg: AZFdTZfMtzCf+fNv2Yzpcl6YL2mNxZYEYvpdKAYKy4SPklEygM+rLixPVyycjZh0QzO
	hmiuxTUIfL7ceDAPOGLPzj9wSfaBOYkzO+IHZeTEdb6zrl+VRN3HcxP+9j06jgofD7v0oOPKb0S
	9Gi6gcXPWx6JMv9jZBSduAPN3CJql/+ocDFZSqCO3JwN1Mn4xF3aMUw83phXuVH0elS0uBVJfd9
	+0y7zDF1jc3e9RcYPXONO2mXDMLCfuAq61/pVyd8VZoZLOAhWJjHcGfe+w9/Tlqp11Fq/4HUt8z
	TN8ayyddgLO04KVBiX3/IR1HL8B0OwhC1P/s66yo1jqzrc1YgM5bZJNMx8wIzIr3f7aBZqNH3eN
	NRqP4Yi9iH77MLDXxyKH7p0COMpWONSRUlqVOsdKMIm8AJP3ukCG23nxtpSW3ObD/uNrU60Dz7b
	krCA5aMI3HEQ==
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr250496695ad.10.1795789695014;
        Fri, 27 Nov 2026 06:28:15 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2ef:e130:1505 with SMTP id d9443c01a7336-2f03f17d196mr250495955ad.10.1795789694501;
        Fri, 27 Nov 2026 06:28:14 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:28:14 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:59 +0530
Subject: [PATCH v28 06/10] power: reset: Add psci-reboot-mode driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-6-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=7143;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=NVV6ctNmJcocqp+yl63j0cDW83nqUgzMxpE5o8IMcX4=;
 b=r5OxQL6tuFpVBA/ojrnN7LBtq03jexRXu6+2XCqJd72OoQDZ5evVcVcOyfBX2+xQHIdLLE7EB
 nRLL0mU2AIxC3dI2eEu1ndD83dg8uTRDwRuOLWpF+/q8zynEtOVGyB1
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-GUID: hnBIShrRyJvrf9xkV4fjIppf8T0Wv0iS
X-Proofpoint-ORIG-GUID: hnBIShrRyJvrf9xkV4fjIppf8T0Wv0iS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX0Kz/L53UC/Sg
 X2O3PM4rv0lLJWo2ARiL42Otgl70rvt7zXSYRqCJocenocXFPNHNLSCTmC9uTl487pDqcqyMG5P
 nTo8xanqwWuzf4iabv0seW2Sy+L11yM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX19YHsVa4nKEZ
 c0RMDXi+nCtsagEi9mbGGExfhEGAyTK0nQERlOoyxaUtsodCZ/nLEXb3aNy2xzd/HcEOMy8VyA5
 LnavqA/9BI0du/LLBNqYknN2GEF0Bsf6Jq6lUTHvjQIxTa2ML7kVjjjKsgoWbz8yb5k5E3NE7O8
 YYxSUrTG3EHmy+sd4s8HfXIQoMrBlwnmrft+maXSfwPgSzEy01NQZcLFof6Jk24Na1mMtkqXPg/
 jkBoD4XrniKDPrLHKgupWXMSNnz8mDhsn7dONK4C6iL5VGV/302WBHledArJr4xWRSJr0J29Z8K
 xZ5gM1Ek04ZpgXTUBrldBMsFf1BO5GoX6ih0AH3vJ3vOvs/17CCycFX8mCqp00EBh4fMFvNG5n5
 OHQ/Ip7euwEGu0runll74Km/VKhkp9johIl2yum1xSQNPmOZg/exp+BXI9JO85XpgAJqN9rP3qf
 eYZI17SSr1CindB6cdg==
X-Authority-Analysis: v=2.4 cv=A875rKWG c=1 sm=1 tr=0 ts=6b09937f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=OTBdipT0aglEIzt2I9sA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_142818_541648_3BB00320 
X-CRM114-Status: GOOD (  31.07  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
there is no common driver that handles all supported psci resets at one
place. Additionally, there is no common mechanism to issue the supported
psci resets from userspace.

Add psci-reboot-mode as an auxiliary device created by the psci-devices
driver. Define two types of PSCI resets, predefined-resets and
vendor-specific resets. Predefined-resets are defined by psci driver
and vendor-specific resets are defined by SoC vendors, under the
psci:reboot-mode node of SoC device tree.

Register the driver with the reboot-mode framework to interface these
resets to userspace. When userspace initiates a supported command, pass
the reset arguments to the PSCI driver to enable command-based reset.

This change allows userspace to issue supported PSCI reset commands
using the standard reboot system calls while enabling SoC vendors to
define their specific resets for PSCI.

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 MAINTAINERS                              |   1 +
 drivers/firmware/arm/psci/psci-devices.c |   4 ++
 drivers/power/reset/Kconfig              |  11 ++++
 drivers/power/reset/Makefile             |   1 +
 drivers/power/reset/psci-reboot-mode.c   | 101 +++++++++++++++++++++++++++++++
 5 files changed, 118 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68811a0b7916b..3c09d2240a288 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22534,6 +22534,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/psci.yaml
 F:	drivers/firmware/arm/psci/
+F:	drivers/power/reset/psci-reboot-mode.c
 F:	include/linux/psci.h
 F:	include/uapi/linux/psci.h
 
diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/arm/psci/psci-devices.c
index d23befc490ed5..04f24b8d99431 100644
--- a/drivers/firmware/arm/psci/psci-devices.c
+++ b/drivers/firmware/arm/psci/psci-devices.c
@@ -20,6 +20,10 @@ static const struct arm_psci_device_info arm_psci_devices[] = {
 	{
 		.name = "psci-cpuidle-domain",
 	},
+	{
+		.name = "psci-reboot-mode",
+		.of_node_name = "reboot-mode",
+	},
 };
 
 static void arm_psci_auxiliary_device_release(struct device *dev)
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index bce996bbef28f..f165a41d40ed3 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -360,6 +360,17 @@ config NVMEM_REBOOT_MODE
 	  then the bootloader can read it and take different
 	  action according to the mode.
 
+config PSCI_REBOOT_MODE
+	bool "PSCI reboot mode driver"
+	depends on ARM_PSCI_DEVICES
+	select AUXILIARY_BUS
+	select REBOOT_MODE
+	help
+	  Say y here to enable the PSCI reboot mode driver. The driver
+	  registers with the reboot-mode framework to configure PSCI
+	  reset commands, which are executed by the PSCI driver during
+	  psci_sys_reset().
+
 config POWER_MLXBF
 	tristate "Mellanox BlueField power handling driver"
 	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index e31cab4ba78ef..45d8aaaffaa16 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
 obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
 obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
 obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
+obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
 obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
 obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
new file mode 100644
index 0000000000000..bbf5477e46cc1
--- /dev/null
+++ b/drivers/power/reset/psci-reboot-mode.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/psci.h>
+#include <linux/reboot-mode.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/*
+ * Predefined modes use two arguments. arg1/magic[0] is always zero and
+ * arg2/magic[1] is one of the values defined by enum psci_standard_resets.
+ */
+static const struct reboot_mode_entry psci_resets[] = {
+	{
+		.name  = "psci-system-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET_COLD_RESET },
+		.count = 2,
+	},
+	{
+		.name  = "psci-system-reset2-arch-warm-reset",
+		.magic = { 0, PSCI_SYSTEM_RESET2_ARCH_WARM_RESET },
+		.count = 2,
+	},
+};
+
+static u64 psci_reboot_mode_get_cookie(const u32 *magic, int count)
+{
+	u64 cookie = 0;
+	int i;
+
+	/*
+	 * For a 3-cell magic, arg2 is the high 32 bits and arg3 is the low 32 bits.
+	 * For a 2-cell magic, arg2 is the low 32 bits.
+	 */
+	for (i = 1; i < count; i++)
+		cookie = (cookie << 32) | magic[i];
+
+	return cookie;
+}
+
+static int psci_reboot_mode_write(struct reboot_mode_driver *reboot,
+				  const u32 *magic, u32 count)
+{
+	if (count < 2 || count > 3)
+		return -EINVAL;
+
+	/* Unexpected value at magic[1]/arg2 on a 32-bit system. */
+	if (!IS_ENABLED(CONFIG_64BIT) && count == 3 && magic[1])
+		return -EINVAL;
+
+	return psci_set_reset_cmd(magic[0],
+				  psci_reboot_mode_get_cookie(magic, count));
+}
+
+static int psci_reboot_mode_probe(struct auxiliary_device *auxdev,
+				  const struct auxiliary_device_id *id)
+{
+	struct reboot_mode_driver *reboot;
+	struct device *dev = &auxdev->dev;
+	size_t count;
+	int ret;
+
+	reboot = devm_kzalloc_obj(dev, *reboot);
+	if (!reboot)
+		return -ENOMEM;
+
+	/* Skip PSCI SYSTEM_RESET2 modes if unsupported. */
+	count = psci_has_system_reset2_support() ? ARRAY_SIZE(psci_resets) : 1;
+
+	ret = reboot_mode_driver_init(reboot, dev, NULL,
+				      psci_reboot_mode_write, psci_resets,
+				      count);
+	if (ret)
+		return ret;
+
+	return devm_reboot_mode_register(dev, reboot);
+}
+
+static const struct auxiliary_device_id psci_reboot_mode_id_table[] = {
+	{ .name = "arm-psci.psci-reboot-mode" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_reboot_mode_id_table);
+
+static struct auxiliary_driver psci_reboot_mode_driver = {
+	.probe = psci_reboot_mode_probe,
+	.id_table = psci_reboot_mode_id_table,
+};
+
+static int __init psci_reboot_mode_init(void)
+{
+	return __auxiliary_driver_register(&psci_reboot_mode_driver, THIS_MODULE,
+					   "psci-reboot-mode");
+}
+subsys_initcall(psci_reboot_mode_init);

-- 
2.34.1


