Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 02:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aEQCUmCT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=duvN2bda;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ToUmbBJ1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=; b=aEQCUmCTujtDowSVKaSN1Lz4oL
	d7J9jofwNIH4+MSSAC/tntI9tK3aujl006Qvv1pGpjpHrC3jTfjPUZP+XPJKsfVI5AzZohaFgQi/k
	L5ofShmTlgWntmUSSUeZgdjS5dirTc6VazJlXg3rFAzuBvMd6FmU2ioBQ6Hw9praRuegVApOZBDaO
	rVVCEZbQRcNUCfz+jhLg0bB6vZxz7U5yMtxtmBocVBpXEEb7M7F6kdRYWjdW/gTMZpXyZ42y25a/R
	vcwX9r1Oe9FHU9FBNDICasVnx0i1S3NEhnk8wlg0w5qI+FS7ZcIf9eDL7I7JUAfdFiyH4tkzglxqm
	8aDB6AOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhN1-0000000BW8A-3cZB;
	Fri, 13 Nov 2026 02:50:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRhMy-0000000BW7j-2p1Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 02:50:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K2p04120222
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a37g3sHH/BrPRBIbWRo3ki
	JCZHWLxPAU9WXyszUcBgI=; b=duvN2bdaP/mtWi+IHKqBXT06ZX4NazHdJpSWee
	VTEmlWrYUpgopHKXhnxdqzY3zf+qsu1Gqb7sgmfQ306p4yboRteI5ANgIkFtB3cN
	owYe/XIpRvFgtT0/s4aBUzak24t2YfGTjIzAozlLWNX2QSuO8L2fu3FnQypn+lWt
	AM94hu3RSEovzJEAwEecr8HCmiFwb4Ji3Z78m/wsl89o6u+bY6+R9Wp8YtWyJ3zz
	cxZNNY1UqXZJrFjSGHS+dBaOQRGQrxv5tUH3yt7ZeIc8nCDdyrsN5X0T+dbZKr9z
	PE+SQ+hwopoCU0DIzmFziNN/d5PywKGfRsOe55kaAnqDSH0Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx334ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 02:50:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea446ea8c9so11819695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 18:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538226; x=1795143026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=;
        b=ToUmbBJ1KD0UeaBMYUDSaT0DjbL9kervRQzNk7z4qMMmL7z7+d8CjS2sLAEKH6yxqu
         15pyW8CSnYVAGMmX3h+sp8q+J5N1/l20GdmwSTVJzU44jV8zkn8KBcw8jZSLt+hu1iPK
         bwiVgoYvC4+vE3vVr5K48sYfk+AATqlajvbSEbvxu1afsgiD4SVtv9oYNi81Z4J2xC7i
         Z08BD980KH4XypnLgaseF9MHarTkG0Y/zk+oZvtap1mdJ1FbXl4subvYlFQQBlFB/FXO
         94sncUbVoF/C4EUQc50/ofuYIqrTVaQHOtbdnM8LIVIZ+0fINo+dypY3BQuJ5RF/iULo
         I3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538226; x=1795143026;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a37g3sHH/BrPRBIbWRo3kiJCZHWLxPAU9WXyszUcBgI=;
        b=NrSNFpXEeN+Fzycres863NxutGeqsA6Vbjhjxs4nmEC4X5LhTBxjyIPsFRDWS91T4S
         gzXow2Y7aUWbjWa7CRFsvI+8JfMC4Mj1zTnz9t4Mu2K0+J0EF4xEMjiGE4YpZ2UB6FSD
         AeEagQySwOeE0F372cRP2/rouWdeGsm3mMWW4vYgPbrf3GfYJB0QrEoHp44z+ZSKsGKP
         ecjeNvPByG/nzKAwz86B/jA68xdN69J8LSEUe6c3vJIjym9r8Gl5M8ycITUAvEOnyFQw
         WnhA8vr/ir25DFu3SNrmDF7JYmyUKIWpi3tXaeHdeeD9P0oH1Mnu7lZWn2vRyxHDhUGr
         GVGQ==
X-Forwarded-Encrypted: i=1; AL+hErH+BxQ9rsuzh99URR1EWV7jaR8P01dEcD8/ga8tz3b1s1sucOMZjanxdcNY7kTkzwFf1FsZITZfnaqK/syaPW5Z@lists.infradead.org
X-Gm-Message-State: APuU4Z8gNy7dWfOeKoPU75BrpAlWdizK4eT0RhLxe3//8zQqaQ27SKYs
	zaE4Bd9CYvDulSYIuOmmVIgKhFmUZUT4BlmG5XfD2XhnWLwwXcen/X3ZKhYIaSGO2MdzwpTKG8s
	cONRxx3RZj12Osv64uOM+FxchXn4dUucatMNBGrB2HCBjj7GHvgPXP93VQzBswPo1COCI7iZssV
	xc/g==
X-Gm-Gg: AYBFou2yl609lzwIF3m+WfxRDyTkdQYxJ0p4MdyfbJs7KJMoZNXXiV1F3nxug3+yRRi
	fKnHVGDTBd/tadCG7wW+MnklV37qjY+zK+ypbR8RvYkF5UM8kWJuF7Ge1mGWVGcqzq99MUJ8Fbz
	33WI9u/Orq373IO46ktH/Y390WWK4RUV7DvTfW9UPIDgju7M5ojqjZT5xuPkSZaMPSH64XptMdB
	Hn0xGzt9Ne58t8RY5N62u3KgTLkUbe5L1urP6KjKC9U0lQB/epECFsIPO7fJzAUgmuE7/N45IxA
	VGSmp2n3u/eL4mJ+I1hdnKmVmnAQwKumLROoyBys4UQyfjJr2zxUT18Po41aLM/N7JDW5lAjo2l
	RUEqDfmQ6H04ZNZK20OmS4lulrWS6Q/LXgh7aQ6/sPzuBJj9usmFHND6cT+RaW+ybImGpFErR5p
	dmqhhzCc8=
X-Received: by 2002:a17:903:1905:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2edf1e7b461mr33349445ad.6.1794538225779;
        Thu, 12 Nov 2026 18:50:25 -0800 (PST)
X-Received: by 2002:a17:903:1905:b0:2e9:5313:8f7a with SMTP id d9443c01a7336-2edf1e7b461mr33349135ad.6.1794538225065;
        Thu, 12 Nov 2026 18:50:25 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa0b3c6sm3044435ad.68.2026.11.12.18.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:50:24 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        mike.leach@linaro.org, konrad.dybcio@oss.qualcomm.com,
        suzuki.poulose@arm.com, james.clark@arm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org,
        gregkh@linuxfoundation.org, songchai@qti.qualcomm.com
Subject: [PATCH v17 00/10] Provide support for Trigger Generation Unit
Date: Fri, 13 Nov 2026 10:49:25 +0800
Message-Id: <20261113024935.3173715-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af67af3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=xzigjciHnW99mS1hBE8A:9 a=QnAfVtFXjStKg8Hu:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfXznfy9Vn+QCYh
 djmaFsQsq+Ki6HLnGvc2wtD0kkzhIk6xHiZmORoDEu2uSfRgbNIcfT8HvZJ0kvqqL9O5t3vZWlS
 oTC258Hrz1+VUFIPgM+JhKMiWXdngRN70WyHz4FfVkjPLtu3HhYodN+pRpFUApjl05gQo+xp2lT
 M5pH46HFBSMA5Y13yhtRgBgbNZIOuEcLwajkwg0M0SXM43NtZvZL3cX44bEtOpm4Hs+4omeq8Qt
 LERHwdxLv7A3KevxajpvQwf6w/UHRTENVuuRqmfN6RZlSWPY5/SKZoWWWzs+bd7baGMEkCs/z2f
 NrH8MpxM27VUTWzu1RSHF93JQeHBuIjCptW6uxwVxmlmueXbTcWusfhnbTt3+SEdJABKK8f2VaX
 jQAHlbIa1UVC/1ANS95Wxiknjwgr6JLDM0RDD1bEJEaluSLc7F4/aUE5MyVi+GrB4rAEnwvZQFY
 7O4lD9ZwpZBru5BQiNA==
X-Proofpoint-ORIG-GUID: HDzQI9t4pYctkmbwzuFdsF1krJEPwSeF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMCBTYWx0ZWRfX9ucDYbE/fUl5
 gvGbAP8u7vzmQpnHpDlD3tlQmLZ27IXK8lXggO4a+jeTtaaaJ4yPUW5tFuhvrXMlp5Mjpg782Az
 470alyQUr/WcwnWU83EeTOIVmGzLmp8=
X-Proofpoint-GUID: HDzQI9t4pYctkmbwzuFdsF1krJEPwSeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_185028_739122_12FFE5E5 
X-CRM114-Status: GOOD (  20.82  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We propose creating a new qcom directory under drivers/hwtracing
to host this TGU driver, as well as additional Qualcomm-specific
hwtracing drivers that we plan to submit in the coming months.
This structure will help organize vendor-specific implementations
and facilitate future development and maintenance.

Feedback from the community on this proposal is highly appreciated.

- Why we are proposing this:

TGU has the ability to monitor signal conditions and trigger debug-related
actions, serving as a programmable hardware component that enhances system
trace and debug capabilities. Placing it under drivers/hwtracing aligns
with its function as a trace generation utility.

We previously attempted to push this driver to drivers/hwtracing/coresight,
but did not receive support from the maintainers of the CoreSight
subsystem. The reason provided was: “This component is primarily a part
of the Qualcomm proprietary QPMDA subsystem, and is capable of operating
independently from the CoreSight hardware trace generation system.”

Chat history : https://lore.kernel.org/all/CAJ9a7ViKxHThyZfFFDV_FkNRimk4uo1NrMtQ-kcaj1qO4ZcGnA@mail.gmail.com/

Given this, we have been considering whether it would be appropriate
to create a dedicated drivers/hwtracing/qcom directory for
Qualcomm-related hwtracing drivers. This would follow the precedent set
by Intel, which maintains its own directory at drivers/hwtracing/intel_th.
We believe this structure would significantly facilitate
future submissions of related Qualcomm drivers.

- Maintenance of drivers/hwtracing/qcom:

Bjorn, who maintains linux-arm-msm, will be the maintainer of this
directory — we’ve discussed this with him and he’s aware that his task
list may grow accordingly. Additionally, Qualcomm engineers familiar with
the debug hardware — such as [Tingwei Zhang, Jinlong Mao, Songwei Chai],
will be available to review incoming patches and support ongoing
development.

- Detail for TGU:

This component can be utilized to sense a plurality of signals and
create a trigger into the CTI or generate interrupts to processors
once the input signal meets the conditions. We can treat the TGU’s
workflow as a flowsheet, it has some “steps” regions for customization.
In each step region, we can set the signals that we want with priority
in priority_group, set the conditions in each step via condition_decode,
and set the resultant action by condition_select. Meanwhile,
some TGUs (not all) also provide timer/counter functionality.
Based on the characteristics described above, we consider the TGU as a
helper in the CoreSight subsystem. Its master device is the TPDM, which
can transmit signals from other subsystems, and we reuse the existing
ports mechanism to link the TPDM to the connected TGU.

Here is a detailed example to explain how to use the TGU:

In this example, the TGU is configured to use 2 conditions, 2 steps, and
the timer. The goal is to look for one of two patterns which are generated
from TPDM, giving priority to one, and then generate a trigger once the
timer reaches a certain value. In other words, two conditions are used
for the first step to look for the two patterns, where the one with the
highest priority is used in the first condition. Then, in the second step,
the timer is enabled and set to be compared to the given value at each
clock cycle. These steps are better shown below.
    
              |-----------------|
              |                 |
              |       TPDM      |
              |                 |
              |-----------------|
                       |
                       |
    --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ------
    |                  |                                                 |
    |                  |                          |--------------------| |
    |    |---- --->    |                          |  Go to next steps  | |
    |    |             |                |--- ---> |  Enable timer      | |
    |    |             v                |         |                    | |
    |    |    |-----------------|       |         |--------------------| |
    |    |    |                 |  Yes  |                    |           |
    |    |    |   inputs==0xB   | ----->|                    | <-------- |
    |    |    |                 |       |                    |      No | |
    | No |    |-----------------|       |                    v         | |
    |    |             |                |          |-----------------| | |
    |    |             |                |          |                 | | |
    |    |             |                |          |      timer>=3   |-- |
    |    |             v                |          |                 |   |
    |    |    |-----------------|       |          |-----------------|   |
    |    |    |                 |  Yes  |                    |           |
    |    |--- |   inputs==0xA   | ----->|                    | Yes       |
    |         |                 |                            |           |
    |         |-----------------|                            v           |
    |                                              |-----------------|   |
    |                                              |                 |   |
    |                                              |      Trigger    |   |
    |                                              |                 |   |
    |                                              |-----------------|   |
    |  TGU                                                   |           |
    |--- --- --- --- --- --- --- --- --- --- --- --- --- --- |--- --- -- |
                                                             |
                                                             v
                                                    |-----------------|
                                                    |The controllers  |
                                                    |which will use   |
                                                    |triggers further |
                                                    |-----------------|

steps:
    1. Reset TGU /*it will disable tgu and reset dataset*/
    - echo 1 > /sys/bus/amba/devices/<tgu-name>/reset_tgu

    2. Set the pattern match for priority0 to 0xA = 0b1010 and for
       priority 1 to 0xB = 0b1011.
    - echo 0x11113232 > /sys/bus/amba/devices/<tgu-name>/step0_priority0/reg0
    - echo 0x11113233 > /sys/bus/amba/devices/<tgu-name>/step0_priority1/reg0

    Note:
        Bit distribution diagram for each priority register
    |-------------------------------------------------------------------|
    |   Bits          |       Field Nam   |    Description              |
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     29:28       |   SEL_BIT7_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     25:24       |   SEL_BIT6_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     21:20       |   SEL_BIT5_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     17:16       |   SEL_BIT4_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |     13:12       |   SEL_BIT3_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      9:8        |   SEL_BIT2_TYPE2  | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      5:4        |  SEL_BIT1_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    |                 |                   | 00 = bypass for OR output   |
    |      1:0        |  SEL_BIT0_TYPE2   | 01 = bypass for AND output  |
    |                 |                   | 10 = sense input '0' is true|
    |                 |                   | 11 = sense input '1' is true|
    |-------------------------------------------------------------------|
    These bits are used to identify the signals we want to sense, with
    a maximum signal number of 140. For example, to sense the signal
    0xA (binary 1010), we set the value of bits 0 to 13 to 3232, which
    represents 1010. The remaining bits are set to 1, as we want to use
    AND gate to summarize all the signals we want to sense here. For
    rising or falling edge detection of any input to the priority, set
    the remaining bits to 0 to use an OR gate.

    3. look for the pattern for priority_i i=0,1.
    - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg0
    - echo 0x30 > /sys/bus/amba/devices/<tgu-name>/step0_condition_decode/reg1

    |-------------------------------------------------------------------------------|
    |   Bits          |    Field Nam        |            Description                |
    |-------------------------------------------------------------------------------|
    |                 |                     |For each decoded condition, this       |
    |      24         |       NOT           |inverts the output. If the condition   |
    |                 |                     |decodes to true, and the NOT field     |
    |                 |                     |is '1', then the output is NOT true.   |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      21         |  BC0_COMP_ACTIVE    |comparator will be actively included in|
    |                 |                     |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      20         |   BC0_COMP_HIGH     |the decoding of this condition.        |
    |                 |                     |Conversely, a '0' here requires a '0'  |
    |                 |                     |from the comparator                    |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |OR logic will be actively              |
    |     4n+3        | Priority_n_OR_ACTIVE|included in the decoding of            |
    |                 |    (n=0,1,2,3)      |this particular condition.             |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |will need to be '1' to affect the      |
    |     4n+2        |  Priority_n_OR_HIGH |decoding of this particular            |
    |                 |    (n=0,1,2,3)      |condition. Conversely, a '0' here      |
    |                 |                     |requires a '0' from Priority_n OR logic|
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will be actively             |
    |     4n+1        |Priority_n_AND_ACTIVE|included in the decoding of this       |
    |                 |  (n=0,1,2,3)        |particular condition.                  |
    |                 |                     |                                       |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from Priority_n    |
    |                 |                     |AND logic will need to be '1' to       |
    |      4n         | Priority_n_AND_HIGH |affect the decoding of this            |
    |                 |   (n=0,1,2,3)       |particular condition. Conversely,      |
    |                 |                     |a '0' here requires a '0' from         |
    |                 |                     |Priority_n AND logic.                  |
    |-------------------------------------------------------------------------------|
    Since we use `priority_0` and `priority_1` with an AND output in step 2, we set `0x3`
    and `0x30` here to activate them.

    4. Set NEXT_STEP = 1 and TC0_ENABLE = 1 so that when the conditions
       are met then the next step will be step 1 and the timer will be enabled.
    - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg0
    - echo 0x20008 > /sys/bus/amba/devices/<tgu-name>/step0_condition_select/reg1

    |-----------------------------------------------------------------------------|
    |   Bits          |       Field Nam   |            Description                |
    |-----------------------------------------------------------------------------|
    |                 |                   |This field defines the next step the   |
    |    18:17        |     NEXT_STEP     |TGU will 'goto' for the associated     |
    |                 |                   |Condition and Step.                    |
    |-----------------------------------------------------------------------------|
    |                 |                   |For each possible output trigger       |
    |    13           |     TRIGGER       |available, set a '1' if you want       |
    |                 |                   |the trigger to go active for the       |
    |                 |                   |associated condition and Step.         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to increment if the|
    |    9            |     BC0_INC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause BC0 to decrement if the|
    |    8            |     BC0_DEC       |associated Condition is decoded for    |
    |                 |                   |this step.                             |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear BC0 count value to 0 if|
    |    7            |     BC0_CLEAR     |the associated Condition is decoded    |
    |                 |                   |for this step.                         |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to increment until |
    |    3            |     TC0_ENABLE    |paused or cleared if the associated    |
    |                 |                   |Condition is decoded for this step.    |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will cause TC0 to pause until     |
    |    2            |     TC0_PAUSE     |enabled if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will clear TC0 count value to 0   |
    |    1            |     TC0_CLEAR     |if the associated Condition is         |
    |                 |                   |decoded for this step.                 |
    |-----------------------------------------------------------------------------|
    |                 |                   |This will set the done signal to the   |
    |    0            |     DONE          |TGU FSM if the associated Condition    |
    |                 |                   |is decoded for this step.              |
    |-----------------------------------------------------------------------------|
    Based on the distribution diagram, we set `0x20008` for `priority0` and `priority1` to
    achieve "jump to step 1 and enable TC0" once the signal is sensed.

    5. activate the timer comparison for this step.
    -  echo 0x30000  > /sys/bus/amba/devices/<tgu-name>/step1_condition_decode/reg0

    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |      17         |                     |comparator will be actively included in|
    |                 |  TC0_COMP_ACTIVE    |the decoding of this particular        |
    |                 |                     |condition.                             |
    |-------------------------------------------------------------------------------|
    |                 |                     |When '1' the output from the associated|
    |                 |                     |comparator will need to be 1 to affect |
    |      16         |  TC0_COMP_HIGH      |the decoding of this particular        |
    |                 |                     |condition.Conversely, a 0 here         |
    |                 |                     |requires a '0' from the comparator     |
    |-------------------------------------------------------------------------------|
    Accroding to the decode distribution diagram , we give 0x30000 here to set 16th&17th bit
    to enable timer comparison.

    6. Set the NEXT_STEP = 0 and TC0_PAUSE = 1 and TC0_CLEAR = 1 once the timer
       has reached the given value.
    - echo 0x6 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/reg0

    7. Enable Trigger 0 for TGU when the condition 0 is met in step1,
       i.e. when the timer reaches 3.
    - echo 0x2000 > /sys/bus/amba/devices/<tgu-name>/step1_condition_select/default

    Note:
        1. 'default' register allows for establishing the resultant action for
        the default condition

        2. Trigger:For each possible output trigger available from
        the Design document, there are three triggers: interrupts, CTI,
        and Cross-TGU mapping.All three triggers can occur, but
        the choice of which trigger to use depends on the user's
        needs.

    8. Compare the timer to 3 in step 1.
    - echo 0x3 > /sys/bus/amba/devices/<tgu-name>/step1_timer/reg0

    9. enale tgu
    - echo 1 > /sys/bus/amba/devices/<tgu-name>/enable_tgu
---
Link to V16: https://lore.kernel.org/all/20260730080704.2903540-1-songwei.chai@oss.qualcomm.com/

Changes in V17:
- Reuse CS_LOCK/CS_UNLOCK/CORESIGHT_DEVID/CORESIGHT_DEVID2 from coresight.h instead of duplicating them locally.
- Replace the dynamically allocated value_table with fixed-size arrays, dropping devm_kcalloc().
- Add TGU_*_COUNT() macros for region sizing; remove the redundant memset() for condition_decode.
---
Link to V15: https://lore.kernel.org/all/20260701055529.445819-1-songwei.chai@oss.qualcomm.com/

Changes in V16:
- Fixed enable/disable race and PM refcount handling.
- Fixed sysfs exposure before driver initialization.
- Fixed priority allocation and access races.
- Fixed uninitialized return value in condition decode.
- Fixed sysfs attribute naming collision issues.
- Added ABI documentation for the default node.
---
Link to V14: https://lore.kernel.org/all/20260417073336.2712426-1-songwei.chai@oss.qualcomm.com/

Changes in V15:
- Add a maintainer for "drivers/hwtracing/qcom" in MAINTAINERS
---
Link to V13: https://lore.kernel.org/all/20260402092838.341295-1-songwei.chai@oss.qualcomm.com/

Changes in V14:
- Fix some typos and formatting.
---
Link to V12: https://lore.kernel.org/all/20260317032639.2393221-1-songwei.chai@oss.qualcomm.com/

Changes in V13:
- add ":" after "KernelVersion"
- add an enablement check in the enable function to avoid increasing the counter each time
---
Link to V11: https://lore.kernel.org/all/ee1ca8e6-8e5f-47d8-8a24-f904ee2fc6d0@oss.qualcomm.com/

Changes in V12:
- Remove the in-ports property from the bindings, as this device is decoupled from CoreSight.
- Update kernel version and date.
---
Link to V10: https://lore.kernel.org/all/20c5406d-3e9f-4fdb-84ba-4cbe629c79b5@oss.qualcomm.com/

Changes in V11:
- Change the names of members in drvdata: max_xxx -> num_xxx, enable -> enabled
- Use "FIELD_GET" to replace "BMVAL"
- Use devm_kcalloc to replace devm_kzalloc once create members of value_table
- Keep a consistent \n above return
- Keep reverse-Christmas-tree style
- Add checks so that the enable and reset nodes only accept 0 or 1
---
Link to V9: https://lore.kernel.org/all/20251219065902.2296896-1-songwei.chai@oss.qualcomm.com/

Changes in V10:
- Modified code formatting based on Jie's feedback to improve readability.
- Applied inverse Christmas tree order to the variables.
---
Link to V8: https://lore.kernel.org/all/20251203090055.2432719-1-songwei.chai@oss.qualcomm.com/

Changes in V9:
- Decoupled the tgu driver from coresight header file and registered it as an amba device.
- Retained Rob's reviewed-by tag on patch1/7 since the file remains unchanged.
- Updated the sysfs node path in the Documentation directory.
---
Link to V7: https://lore.kernel.org/all/20251104064043.88972-1-songwei.chai@oss.qualcomm.com/

Changes in V8:
- Add "select" section in bindings.
- Update publish date in "sysfs-bus-coresight-devices-tgu".
---
Link to V6: https://lore.kernel.org/all/20250709104114.22240-1-songchai@qti.qualcomm.com/

Changes in V7:
- Move the TGU code location from 'drivers/hwtracing/coresight/' to 'drivers/hwtracing/qcom/'.
- Rename the spinlock used in the code from 'spinlock' to 'lock'.
- Perform the 'calculate_array_location' separately, instead of doing it within the function.
- Update the sender email address.
---
Link to V5: https://lore.kernel.org/all/20250529081949.26493-1-quic_songchai@quicinc.com/

Changes in V6:
- Replace spinlock with guard(spinlock) in tgu_enable.
- Remove redundant blank line.
- Update publish date and contact member's name in "sysfs-bus-coresight-devices-tgu".
---
Link to V4: https://patchwork.kernel.org/project/linux-arm-msm/cover/20250423101054.954066-1-quic_songchai@quicinc.com/

Changes in V5:
- Update publish date and kernel_version in "sysfs-bus-coresight-devices-tgu"
---
Link to V3: https://lore.kernel.org/all/20250227092640.2666894-1-quic_songchai@quicinc.com/

Changes in V4:
- Add changlog in coverletter.
- Correct 'year' in Copyright in patch1.
- Correct port mechansim description in patch1.
- Remove 'tgu-steps','tgu-regs','tgu-conditions','tgu-timer-counters' from dt-binding
and set them through reading DEVID register as per Mike's suggestion.
- Modify tgu_disable func to make it have single return point in patch2 as per
Mike's suggestion.
- Use sysfs_emit in enable_tgu_show func in ptach2.
- Remove redundant judgement in enable_tgu_store in patch2.
- Correct typo in description in patch3.
- Set default ret as SYSFS_GROUP_INVISIBLE, and returnret at end in pacth3 as
per Mike's suggestion.
- Remove tgu_dataset_ro definition in patch3
- Use #define constants with explanations of what they are rather than
arbitrary magic numbers in patch3 and patch4.
- Check -EINVAL before using 'calculate_array_location()' in array in patch4.
- Add 'default' in 'tgu_dataset_show''s switch part in patch4.
- Document the value needed to initiate the reset in pacth7.
- Check "value" in 'reset_tgu_store' and bail out with an error code if 0 in patch7.
- Remove dev_dbg in 'reset_tgu_store' in patch7.
---
Link to V2: https://lore.kernel.org/all/20241010073917.16023-1-quic_songchai@quicinc.com/

Changes in V3:
- Correct typo and format in dt-binding in patch1
- Rebase to the latest kernel version
---
Link to V1: https://lore.kernel.org/all/20240830092311.14400-1-quic_songchai@quicinc.com/

Changes in V2:
 - Use real name instead of login name,
 - Correct typo and format in dt-binding and code.
 - Bring order in tgu_prob(declarations with and without assignments) as per
Krzysztof's suggestion.
 - Add module device table in patch2.
 - Set const for tgu_common_grp and tgu_ids in patch2.
 - Initialize 'data' in tgu_ids to fix the warning in pacth2.
---
Songwei Chai (10):
  dt-bindings: arm: Add support for Qualcomm TGU trace
  coresight: Move CS_LOCK/CS_UNLOCK to linux/coresight.h
  qcom-tgu: Add TGU driver
  coresight: Move CORESIGHT_DEVID to linux/coresight.h
  qcom-tgu: Add signal priority support
  qcom-tgu: Add TGU decode support
  qcom-tgu: Add support to configure next action
  coresight: Add CORESIGHT_DEVID2 to linux/coresight.h
  qcom-tgu: Add timer/counter functionality for TGU
  qcom-tgu: Add reset node to initialize

 .../ABI/testing/sysfs-bus-amba-devices-tgu    |  60 ++
 .../devicetree/bindings/arm/qcom,tgu.yaml     |  71 ++
 MAINTAINERS                                   |  11 +
 drivers/Makefile                              |   1 +
 drivers/hwtracing/Kconfig                     |   2 +
 drivers/hwtracing/coresight/coresight-priv.h  |  20 -
 drivers/hwtracing/qcom/Kconfig                |  20 +
 drivers/hwtracing/qcom/Makefile               |   3 +
 drivers/hwtracing/qcom/tgu.c                  | 847 ++++++++++++++++++
 drivers/hwtracing/qcom/tgu.h                  | 179 ++++
 include/linux/coresight.h                     |  21 +
 11 files changed, 1215 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-amba-devices-tgu
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,tgu.yaml
 create mode 100644 drivers/hwtracing/qcom/Kconfig
 create mode 100644 drivers/hwtracing/qcom/Makefile
 create mode 100644 drivers/hwtracing/qcom/tgu.c
 create mode 100644 drivers/hwtracing/qcom/tgu.h

-- 
2.34.1


