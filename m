Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C3E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eq79vYBs;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ov6BeQNz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WiDnsZJH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=; b=Eq79vYBs8Ny6JE
	P7yuIya9UQCY+1dienQ3duXuW9VDrXlMkqYW/37qt/8XjAWWRrb9HRTbLkbUjahlwAoehJ9xODk/W
	OWq48QkpYzeZMs4rWGaZ1Q2Mqp7HbHe7qCnLI1dlKc/tQb0oLga9l5pA91Fe3QHdCZ1CTsu27bLQv
	kr6FaYQOG5P8OIqINckQN7LPaqUQ5Uo25R3kIE8hQzmbiF5oN+g7sKwek8y+U3Xi+m7Otm4+uxZL9
	WJSthPW4iT4azrZ7+y/qzBBSI4yQh68W5gtDEdVdNyis2AbKFi9ozzoyPvS6cf7YgD/lEn8ZdaYG6
	Y6wL0Lpe1uCulHfMe9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQulE-00000005CjO-3agM;
	Tue, 10 Nov 2026 22:56:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQulC-00000005Cis-3Fxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:56:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAML851153505
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=; b=Ov6BeQNzTntj9HcW
	wbs4O2yz17+nev0I4Zd5vxZlzzZtk9gqz5vw72UU8/FduBZai+HCNmoZocFCUA5s
	u9rb+1OyEbTBlNF8Cmjd7PNJN+KlNR8pczs0gRhBi2F4HNZpak+794p2jD563TD8
	I0yjV1Pw2o9hIjrxuFZPJ70za+rgiAe8ASscdlTOqbq0paRAIBO9qY4DuCrDi8c6
	9l7AoNMDmJZru9h8CZJGq+cfZuR1H9N0oje+9uZdjfwA8pSRNvdZ07EE94zB3g7C
	LB3uZ+nA0hq3rbqVOz6za0oM7/67rt3nYpyOm+GxVvikxiEY2j96ba/3xIomdfoI
	GMy+5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux84bpk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:56:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso121889eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351373; x=1794956173; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=WiDnsZJHaFxpi4Q64MEdnfSx2k7T2G2Ey7o9C49rV47sB2t8MdlKJCEPPMbr+Mry5F
         KdJ+mQV76mooejZyE0lwBEV+tg5n4DwbqIVidlWScISMDQ46NiPWQWtFvJpMNIc8etYz
         HWxf0i2tmFcJhpUsA1XsHuYw07ECxOEsdulwh8wblb8JkJE/nXjA2qpQOD3pvvDpds8I
         KpgZOUAsopUmQ/Vfml6IiFZOiuyk4mWi5QuUhUun7srx4/TRM5SLn4vK//9HkyS56c5r
         0Al3YcjVDouHBI5pKmZ7hdqokxbOckvJqvTnEDBcljTqAsq4+M1usEPJbaJgjv05lLxh
         cbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351373; x=1794956173;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pVLYAyFt8ENqb3WmPKl43dt9zgX8q4AFgrY+mBvlXo=;
        b=EDwnHJkYhEnF0spxL++iNjvPX4OE0+fnU4eKWMcjKjKgfn4vYe25rxNUmTAqCBS2Lz
         56HdQdt+2nT3mRaOnBIvLO/YetFLyK8hi1COk5/z9ZmQR7iqpBe6mTlOt1/ZA2gHy28L
         bfi6bfZcko8fs2QL4zWeii3AFuYW/kltoUeKAKAr1ObZUG+HwoFKNxlKYGY50Sp5mG8q
         iTmqMTFQ3R7FJN+soVqvxymc/82JbwcZAHTarjMi0t2ep26So0oJCX1lLY5W2OqyuR0f
         v9a41px+eepjimFDXUUKN3aXemuJczt2nikluKqMP6h4NroR1TcmSb7kt7oBDtJgSGo6
         TpuQ==
X-Forwarded-Encrypted: i=1; AL+hErHk/yLAFUlG2pG6wqUk43DxidlE19bJBYTvXEPotBcIt60nmg64QxsprAsliwRKgqqnKkshsAJ5+guLzy6AmCxq@lists.infradead.org
X-Gm-Message-State: APuU4Z8DKBWwENognT9Cy2/uzDQLImP7habhxMdmRanF71ZaHDyN/JxS
	OhNhWe/yG1MSXmm833406Mu2CjY32gKMvqXVQRZH+atqaPsgouf+rtHXhZ4NDNcvlVaWmGLBjBt
	Pl4ZQ2JVe1FG/2GVwnO/T3At4At4bTezOR4igteBs3UBl18ElWDraZoNCfr5Mxx1UGJ8QLRk8OV
	FZog==
X-Gm-Gg: AYBFou3LvUKoTPx24V91wqMQ/4vXdatbao/hW2A+YCwGXlyOBVAMZmR3gdz6u0W0+vF
	eN7RQgLQNk5xEahIWu/TNyS1VEKw/1WUIjkfOLtjKUxJg5PacwOGagDAUwrohR3+WIOfPigqEiG
	6b0ShcwIHObXgJi7iAM5lCACZT7SKbT/PK6QFqgb60ZG+n7bGx+CZMNkDkhdgYj+nGp0RWohVI8
	4wvxFVNI3DbiQxHqpirjh/wm93bkgpM0kpMz9I894KLj2yGJt+s1JlYWaTSkfE28QBFebQopilg
	vthD1+2irAsA7c7EfSD1KPMjTfaYBAAGhyao0BU5N57KwUOlCrYXUOm8j42vnpqo9FmxLySAYuh
	lCqsqssL/RUINdyqbvOsF7Ybh1tDn4EOJ5hAd9/mjJzJIfjh5R+tU3gwsK63CXwtxMj20tOTy+5
	fAOtp4HQvTiWhaNoQBYeblQM5EJSF5
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135981eec.16.1794351372658;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
X-Received: by 2002:a05:693c:401c:b0:36c:a281:1bc with SMTP id 5a478bee46e88-37685896901mr1135938eec.16.1794351372085;
        Tue, 10 Nov 2026 14:56:12 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520608b52sm8943607eec.13.2026.11.10.14.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:56:11 -0800 (PST)
Date: Tue, 10 Nov 2026 14:55:48 -0800
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
Subject: Re: [PATCH v15 26/35] firmware: arm_scmi: Add Telemetry debugfs ABI
 documentation
Message-ID: <20261110145548.0000663b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-27-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-27-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX5+qfb/S1XM6j
 Mjf0nD042xArOFXeH3PShvpziTqWEvsFKmd+ccKzqv7pM200DCTOJkAuHTjnogctmTczIIvx7Lf
 6+V68UWHMrHvFpWlboDzZE8nCYMBl35tb99+6gzcYd+pMqNPC9ynTu1cTZfLsxh4p0p8hfS0ngH
 gqcGG/bhuafh1DhIcihd947ATyZpWB6m6FaL138JMuyNxjeYLdw4JInAR1MS+NT5c2z8UXOSsZV
 aA2mwEVEHKoIgo0N38a/kF+6mziJ3BWwQ84sv4o6UqYX3z4N+08G2xwLOrXFO/ePiu71GGcNNKj
 pDhkuQ8G85j3GyC/PjSTesOZwz5zxjmykrIJeudwbAYVkZVkwy19lRrx85QWSYPWSC3pxqVYesX
 lyd1vC3MQBCx+UURcXrEbuEgqKDpu3cmJ6nk2sCtDT49mINBNE/mIjS6x5P2lfhhxP0jcJyU4sK
 aYbuK3VICjZmd3egJbA==
X-Proofpoint-GUID: 54Ajm6KGjItX5sWK96oGv0EYG2hYXvum
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfXweR609HBczBg
 NtoqvNyq86f2Zol4LOuDdWIA08k5x0Uv08UtJK0C9VpD28PneGWObVqal8xhuu2WaVl6sqASzFy
 ei0wGDazzpCufhaARkprvg5E6O08+rw=
X-Proofpoint-ORIG-GUID: 54Ajm6KGjItX5sWK96oGv0EYG2hYXvum
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af3a10d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=Z4ki0kIUKxbu2UUS7qYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_145615_103713_70524674 
X-CRM114-Status: GOOD (  22.10  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:12:12 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add description of the debugfs SCMI Telemetry protocol ABI.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v5 --> v6
>  - fixed typos
> ---
>  Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
> index ee7179ab2edf..edbbe360321d 100644
> --- a/Documentation/ABI/testing/debugfs-scmi
> +++ b/Documentation/ABI/testing/debugfs-scmi
> @@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
>  		the currently configured SCMI transport for instance <n> on the
>  		RX channels.
>  Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
> +Date:		Nov 2026
> +KernelVersion:	7.3

Overly optimistic use of time travel.

> +Contact:	cristian.marussi@arm.com
> +Description:	A subdirectory grouping debug entries related to protocol <m>
> +		for instance <n>. Each protocol owns and defines the subtree
> +		of entries rooted under this directory.
> +Users:		Debugging, any userspace test suite
> +
> +What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
> +Date:		Nov 2026
> +KernelVersion:	7.3
> +Contact:	cristian.marussi@arm.com
> +Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
> +		order to dump the latest snapshot of each SHMTI memory area in
> +		binary format: each file is named by its SHMTI id.
> +		File is seekable and a seek to position zero on an open file
> +		causes the SHMTI snapshot to be refreshed; file timestamps are
> +		updated after each snapshot.
> +		This directory reports SHMTIs for instance <n>.
> +Users:		Debugging, any userspace test suite


