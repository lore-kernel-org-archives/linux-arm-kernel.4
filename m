Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B76F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 00:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KqA1j5Ux;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+WhPqkk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M1zq/EGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=; b=KqA1j5UxdaCzPG
	mn9WiH82vaYqRtn7lvxm9uL8n2ujNCOVIu8GXSCLdLZxp3lxp2hAN2y2igXyH6n1Z6J8PztPlFVfq
	l3nRf2gs67bmsja47mN9+YhZj8R4FgmNPBvShujGHlRe6vri1fkuqWXkEbqRRJLukL+/QWvVanLqR
	pbpKbwIwu0R4GoJGVjylm/HLRKUde0PH+mMr9+rthambVkM77aY+XtKxpiSsX180WAg4gm9J+LIQ4
	HPt45szYqECx5eyJaTHAwzTF7I7QfC82Z94JQ+ruFmPCbYJA0OYVmmOssg1+JXQpeqGJ8Qj87Jdh7
	0lm/ExKmhRYP+ObKBb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwMG-00000005Keo-14BX;
	Wed, 11 Nov 2026 00:38:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQwMC-00000005KeO-2Mpk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 00:38:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKePu3715098
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=; b=d+WhPqkkWHezj4wX
	2kdBBiWrMpK1/053nQziauJcW2KmfS6U5FwfbZNNHWdl1hx+JRCCIdZpSckqruQf
	68yBu+FqiQjApvultKCAoDsutMAFpoOGgMWlHnDCkjCxuHU4zR0GTPwT//DHnHAg
	bBCrAlwwzqRtsh/+3dVE85fzZxKw5UcINxAbROB2+MZtemTP5rH5FH+JTfFaGTC6
	tnMpHn9SZBu90E5sVb65QqXACCl6P5nl4aMNyycWEQ2th0Uin6Y3pJrFGitUgTQi
	XWMUusSay7go5ZCCR+GGZEb/V9wxS9LpVtWFlXuvlB+iTS9favHA5t8ZkxGgqlVY
	gEklkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4bjee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:38:31 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso3862051c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 16:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794357511; x=1794962311; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=M1zq/EGGub1m4QGCD9w95oDfm0wr9vP7BXAf0yrPZARI/rnIUCrwZct5dXCBODVo/D
         uHBEMTKwfHiWmOxaLubpX9lc7QX1uqdwws80BV86t/NzNP9qNDxINQwzE9JrsJ1q/1qB
         bfsOdzRbAfOqrC4KF/T0w8c00wu4siV7BVmlRi9Fb3DTecxdh+9OSHnuopBhSSTPcHlX
         dQzzES2yKQTEZ0CW0K459EmZclNAnfgdFfrQWpy89g2ZOTaqmyuppAJ+D0pzxtdrFcrO
         1raiGpevZqsnc6qoUl5+3FerHwysmOdcMRa9bysYAncKQmT2n0XxE20MKQZPQb1A2ASn
         rlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794357511; x=1794962311;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7sT3iRRUxq4eJr8TTxsciCtoFllJMXAiuKtYZTtyv4=;
        b=EiVtwkunRvGJJqhm3wf6kYrBvsGqAn6UcNofilWpzNPueEQF/yDbAxhyG5A3Pl7enz
         TwOQ1ZPzDC7wz5hdIjrcX1WthBqWi8geuia+yYo8DPgXsgp6XbIN7Oho61cFod3Tu42Z
         zdvH73NNaH3MvWDqMFmwTvHftCngRyoTA7wxEnCoFYMgSKHc6YfsYcFPcb+ooXhyr9sL
         6IRIq/8TAqmm9oVDnuK8y3CZ6Tu7c2szxRChougp2ZNdrYwsnmJPTnxCwfYKn2OqDBmU
         sNUVbqT1JvN8WkR4SjDEp91Bapk981SyWIhspl19lLa1dI3QwqZUbxDE6w+dePzbxqaX
         6Vkg==
X-Forwarded-Encrypted: i=1; AL+hErHOvTAT7HsucBSHbhyul6o6/W16Jfy3KIc9SuO5DdUjRVqxp/JsF8AQQOCf/Dc8/epur0RVda+o4bDEh+Zwh7mz@lists.infradead.org
X-Gm-Message-State: APuU4Z8LrnvAZmaEvXHqEPBzlXgvOjSlxghyi4Xlkjdd1cDafOW6+wYn
	rUQvHIy/JEAzzfOxZ5rSwFpwgIJYK+oJiayuAeEDHsCDjW7gtzRlxjiXkSxG4fe2lBWwlxFAhlY
	9XGRFUbC/b6a06Fi4CeV9etcFVAnqUFLp4I8BsdybXEpQQih970EyjNAWICoLGhX1WPBj+StHv3
	GpWg==
X-Gm-Gg: AYBFou0L5sq6r/oNpJM3dVAjSKP56ejk3cxL22FkBimRsSAPO+3hc5XFt/FVtAc5sSh
	/FL3JDRms/9n06v+gz/UYYInhCAxH7UwR4gxV9j23hN78rHKJVNQw4pIf4s2/osGvKX1bRK00Qg
	UXGTQIfBcjT5zQhVytAHpW8/BcRliJzKyT3gD40TkqXhEWWrA6DOrZ3tvFzNZGZ3JxLRob1oeeJ
	5WLrpQWe2ICb1zDuu5fG92GxYk5zCGowqwXdOI7VggP3/Z+wQs3CZchfUIrYS0ufhQFOElcs8ZK
	HnPlBY9pBhLTbkdtKPLKv07gcbXWyQ9oSr4mFBU2jJDSccKtKIQyzEkIkKDvpF3UOyiwNsJFJGn
	D65vdUQDeHddr0wK8Z5eHepqQla36+UXHXJ6VN5VP9JYjz1CjnWcoRJzmF974N2znNZ9kshvrUg
	IevbMpldB/EipJruwz8YAThlJKmbw=
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642287c88.16.1794357510807;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
X-Received: by 2002:a05:7022:170a:b0:189:d6bf:7eaa with SMTP id a92af1059eb24-1b3c02fd370mr642263c88.16.1794357510143;
        Tue, 10 Nov 2026 16:38:30 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm10623417c88.9.2026.11.10.16.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:38:29 -0800 (PST)
Date: Tue, 10 Nov 2026 16:38:09 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261110163809.000070d6@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfXzkhiFHKvBHIU
 vxHcKjRJLa7FBF8R4V8+ZDi/bKz3b4l08GXgNOy6YLmKG221v+nZH+VnOP320G6L/o5xhj2+Ybt
 PutFJxvbw/9eZrbegTInf6Rc+pbYF9tXrN9aHDCEQn3w+0kF6WSCXg4Z9xhJrjCu+pS/64FTfTJ
 wcmPOG6wVRlJuXTBoOtb+W/0ccAxOvKaNdKXp3zCFRgCO8JovGKQViMjlYQM2WURqPDwnM5Db+k
 Q8dsw+fpKORcAV4m0MXmo8cgJQPZnGo8ASM9tmAHauTFYS/INrs2uk65ASbO5g0D28pS1P+pIZJ
 kynpMQG2Ng1t353+l9cEGor1UM9KAEgXZ8Cr1tW2NsdMfWgbs8nWlc6vbo7+0KSLL+5cZ6DV4cg
 8YTqf1Dt6apyXntsH2mW46PhWw1uJuapu3ZSNJtOGpZ+/yjVAHiK1c3dlWI1bw9sae/sw91EIxA
 iDf2d5Ar0SD5ABA6G7w==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3b907 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=4wJChP4EGU-GPyPzoMAA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMSBTYWx0ZWRfX89e76eZZtymp
 xj7UwSkeKspkhIsIIxvigRtI2uKfHE/4AVt1dV+PRdEGc4s0YbliO8NSirRLdtBfOAfTDteqWgz
 X2UN4utKMU0uhEGnWthtV8I5V3gDGXc=
X-Proofpoint-GUID: N_mxDMJAPho50AWFhVXJxT3VEcl3s_BC
X-Proofpoint-ORIG-GUID: N_mxDMJAPho50AWFhVXJxT3VEcl3s_BC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_163832_619798_C45431AE 
X-CRM114-Status: GOOD (  48.08  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.
> 

Hi Cristian,

So, the main issue here is pretty much summarized by:

 28 files changed, 12801 insertions(+), 99 deletions(-)
(obviously there are tests etc, but it's still > 10k lines)

There are relatively few reviewers who would even consider taking that on.
I foolishly thought it wouldn't be too bad (and I review a lot of code).
By about 3/4 of the way though, probably much earlier, I know the quality
of review went down considerably. Honestly it was probably a waste of
time continuing but I'm stubborn like that.

So, unless you have a path to bribing or sweet talking various folk to
deal with reviewing this with each having to set aside multiple days
to do it, likely repeating for a couple of versions yet, I think you've
got to figure out out how to make the first patch set more manageable.
Probably don't split it up as much as the mpam or CCA folk have had to,
but you have a lot of colleagues who are experiencing the same problem
at the moment. They may be able to advise.

So it would be nice if what was in that first patch set was 'functional'
but I don't think it needs to function on every systems or support more
than an absolutely minimal feature set.  Just fail to probe when you see
something that isn't supported by that minimal set if that means
the thing won't be functional.

Once that's in place, over a couple of additional patch sets you can
get to everything you have here.

So what if you choose one data path (shmti perhaps), no notifications,
events, maybe even simplify to one of the readback paths.
Maybe even drop event groups initially. 
Possibly even drop timestamps.  Definitely drop things like boot-on
support and debugfs (unless you are using that as a cheeky 'functional'
test ahead of the main userspace interface.

How much would that slim things down?  It doesn't even have to be
useful, just testable.  Realistically I think the hope of getting
enough review doubles if you can halve the size of what you are asking
people to look at.

Anyhow, gut feeling only but the code felt like it was in a much
better state than some of the versions I've looked at in the past,
so I think the game is now how to get it over the line!

Thanks,

Jonathan


> In a nutshell, the SCMI Telemetry protocol allows an agent to discover at
> runtime the set of Telemetry Data Events (DEs) available on a specific
> platform and provides the means to configure the set of DEs that a user is
> interested into, while reading them back using the collection method that
> is deeemed more suitable for the usecase at hand. (...amongst the various
> possible collection methods allowed by SCMI specification)
> 
> Without delving into the gory details of the whole SCMI Telemetry protocol
> let's just say that the SCMI platform/server firmware advertises a number
> of Telemetry Data Events, each one identified by a 32bit unique ID, and an
> SCMI agent/client, like Linux, can discover them and read back at will the
> associated data value in a number of ways.
> 
> Data collection is mainly intended to happen on demand via shared memory
> areas exposed by the platform firmware, discovered dynamically via SCMI
> Telemetry and accessed by Linux on-demand, but some DE can also be reported
> via SCMI Notifications asynchronous messages or via direct dedicated
> FastChannels (another kind of SCMI memory based access): all of this
> underlying mechanism is anyway hidden to the user since it is mediated by
> the kernel driver which will return the proper data value when queried.
> 
> Anyway, the set of well-known architected DE IDs defined by the spec is
> limited to a dozen IDs, which means that the vast majority of DE IDs are
> customizable per-platform: as a consequence, though, the same ID, say
> '0x1234', could represent completely different things on different systems.
> 
> Precise definitions and semantic of such custom Data Event IDs are out of
> the scope of the SCMI Telemetry specification and of this implementation:
> they are supposed to be provided using some kind of JSON-like description
> file that will have to be consumed by a userspace tool which would be
> finally in charge of making sense of the set of available DEs.
> 
> IOW, in turn, this means that even though the DEs enumerated via SCMI come
> with some sort of topological and qualitative description provided by the
> protocol (like unit of measurements, name, topology info etc), kernel-wise
> we CANNOT be completely sure of "what is what" without being fed-back some
> sort of information about the DEs by the afore mentioned userspace tool.
> 
> For these reasons, currently this series does NOT attempt to register any
> of these DEs with any of the usual in-kernel subsystems (like HWMON, IIO,
> PERF etc), simply because we cannot be sure which DE is suitable, or even
> desirable, for a given subsystem. This also means there are NO in-kernel
> users of these Telemetry data events as of now.
> 
> So, while we do not exclude, for the future, to feed/register some of the
> discovered DEs to/with some of the above mentioned Kernel subsystems, as
> of now we have ONLY modeled a custom userspace API to make SCMI Telemetry
> available to userspace tools.
> 
> With V5 we adopted a pure chardev/IOCTL ABI approach, refining the IOCTL
> based interface already present with the previous FS-based ABI.
> 
> INTERFACES
> 
> For each discovered SCMI Instance a character device named tlm_<N> is
> created under /dev/scmi/ subtree.
> 
> The IOCTL interface described at 'include/uapi/linux/scmi.h' is made
> available to enumerate and configure Telemetry resources: Telemetry data
> can be collected using a few different IOCTls, depending on the required
> granularity.
> 
> Alternatively it is possible to obtain a list of the file descriptors
> referencing directly the underlying SCMI Telemetry SHMTI memory areas and
> implement in user space an SCMI Telemetry parser accessing directly the
> SHMTI, while staying in compliance with the SCMI TDCF format.
> 
> NOTE THAT from v3 onwards the firmware interface level NOW supports ONLY
> the latest SCMI v4.0 specification [0].
> 
> Based on V7.4-rc2, tested on an emulated setup and AGI HW.
> 
> This series is available also at [1].
> 
> If you still reading...any feedback welcome :P
> 
> Thanks,
> Cristian


