Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D73606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nhCHN3vS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yuo1goiJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE6lOn18
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=; b=nhCHN3vSjkaDo9
	/v3/07d4R3r6tfvfs5EyssNfnb4L6Q0kRyVRK0uHypyjv+co5dVWmTxg5v9CrV+XIC2EkasufGMB0
	zuJ7Ae/PP4yOa3YunCcv29OGgeDGAxMRbNjzjLYQILvvW3mBXeYruPIssD+vqIAB/h8Vg/rwiSKfn
	sni3+3I+HoFsJJt4n5i9eKj8u/xYo7M/ATnCVtGrb9CQ9/AXOQ+lRkquI9kW55WQn5RfOnhEkspXP
	ej3M5FzOLIKP8t5uJ2VLTOd5d1jIdjjEUmrE+uHTkweUc8Tl4x1jKijr8ACnoEbV/SJI8IOZorq0/
	hAcMcuIz5C3kYo7h4bNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErn-0000000ALAb-1eEU;
	Wed, 25 Nov 2026 15:25:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWErP-0000000AL0P-3ONH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:24:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM3qk047556
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=; b=Yuo1goiJ5qmPqUx/
	ZyTezbGG4xC5I59wiMc7Iz9T9+7q7RIcmrIKDNOJsBeSndc6msBmsChfMPPTo05Q
	GMdzgqrGWl3VFhQM1t3yQtSq1UJGeC/ks9BWUf1YbvsMMwp9l5za9uQ3JPLF3hB4
	lKYhuTKLl6jhKOIpkf+wdt9x78mxk3rt/0UJevle0lMv2b222TCemjPLr9DhRDc+
	3+D4JfF1uZcdDzHIdpCcQlbClrQCza7wwsAelxuYA8mmSlvTgO7yM33bxfUNvmbg
	xsl43Qdsj6vbS+cbITAODU4lIO6QVE7raCl0rOFhvdTg9TKE8kkTN/Vh7M75WvPl
	HsCpcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2bgxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:24:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdea3a64d1bso1532256a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620278; cv=none;
        d=google.com; s=arc-20260327;
        b=BOXKcKK7+IbNNqmZd4rYECg3ANsHbhyheoyVo3yNy8GcWF+rHqihT6Qpx2HikYHhIN
         O84AWr6BUFbbb0bCIPdxXgw3uG2mNw0+cv1SuP+QJqN4Smm4aXKuIlPSOw+LiXHTqngA
         9zD5VCJDQZ5lHQgxxGO9MntdWmst/HUyfe1Q42qFFEmMMgPKC7emcwu0EI/W0DuzZ2HA
         vTvaaacVrdphCcviIEDxdsCek+tNJt/m0+ZNy7i0iQd119xQnSzeqRNTQkV/Y/Y9fp8E
         QW8FkR58Mtg70HxyjMiDJBe2uR5/19n7nhVo0ENcI6KiAYlmOO1SwzxPBO0mh/TURfSn
         6xaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        fh=polbRDaxcVbQxCDOMcY9QlLM14YBNwNnbftasDOdhfo=;
        b=f6trfGjKPdAvqxGyFiNrGmXn0Xs9kzlnUeuuOAHLvoiKWi40WE2o41LxEApiBrA0iW
         rrr6yegIrg2mLUHPud3/Gz1j7sLZjBMXttvfEZfqvnKbXox0ZZHtACVd36PE31QIyahs
         kVf5ZiQxS45v6+ZwRxySfOdkT917l7iA0nT5sq+49n115wHKEHgmzvccgXEcevsWr3h7
         OwOp5F73+W3hPftNcK/0bcuogpksnB2B7uc+yRjp8ZLs1rdT3znK6m7mDdRccerodM6j
         R+OK32//UayEH+cIs9xNPUQX2pBJobraOsNtB7FVmksNe70fqCgVon3L3h7DZF2LR0kg
         FuSQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620278; x=1796225078; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        b=kE6lOn18qbLhhtQvRXauEff6Xn3XcRjMXN2YnGo0vJOo0jcwbQZMoqpb+LwGgV+gJr
         FrlK3tA4Plg0hs/FY0ZkgLRziE5r7OVmKnKuB0IBOjxODUN3Y5qb6C19brytHKQHS2sR
         Nh+i9DcautmTIlllt7xYaswcOMsHjwI+bwAnd7pFPnsruer/5HTgvcBWgUk4nYIFICl5
         YEdydgDF45UHVIpH+2udKmaujq/6ac71yR/5UgAHMCgZe7JUCrsPPKskpP9XFfIxEJ/5
         jRW4hUshlONS64lIoGhvravK2Bcv5yJSS4+V9yQqaBLjoVF/PIykaWB2BOa9awOr+w72
         pu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620278; x=1796225078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        b=XK98JbqFyw+eP4PCcOgUm7luCOuzS5KYmdQuTMDbwz9nfZtMqGv9fIZbo5kdKM5NWF
         0ohTFip4wVJt8dxfg8kXi+6wC18MavzvKnGZzwzsJoHDavNkK14gVoIAJuke0Q+pVYmS
         wE78tr9pr5N+a2rF7vog4/TS0OschXgDbhD+pzbmpOwPatvbE1BglwsQ2LuiKiHH+AH1
         5Lup18dRrBiVs8h1zwvV0osEX5Wd+0PrZmEia3FoeQSowOwROvjItb4mMNJfmxWiijCN
         nM6AwpCwnESbGcvE8yV8kobNXEghRzE5DsmViQDZG6h32OzG4TQlTACnue99e0ZcCs/a
         tP0Q==
X-Forwarded-Encrypted: i=1; AL+hErHIA68EnhqYW5vqapsi/x6LvajOtRBIk7XeniD84NN4/7aDg6FE+CoPxEtfdPC+Yz7pv4dYE8kcndwVXSDzXC5p@lists.infradead.org
X-Gm-Message-State: APuU4Z+5ar7oN4T+cvQcxD4GtlXLh1aKkLvJ8ajiZvNZJ3616OJE3FP1
	SMav0vGOqEcFbOh6aQy+krUPAVy5dmCAeqcFcRwPJef3PUONn4ymF29UKkZF6hBRWZSIMRs7i5H
	VggR61ptIrhZssRVkvcb40icu8Vg3ch64Wonal5J9d9+YrzgRMdmG+Z9vQS818GFe2viPyi7jWo
	8b35qxtiz0bqTyKSI4vTY/vKf+q1LVfFZEAroxNiQOfjdpOm+EuNiz
X-Gm-Gg: AZFdTZd3uF+ukkZ5I9mihcOp/kmXDIFJges+SrXMpyZJT5gTe5gLTawqLak0vbZmEIS
	4ed4Dcy6r1VqBCDMPgRWMHYu1T0Xs+B4DepqLS9sL82J0h1SlYT2myyMj3uvVYUkVfF6hS6w2WL
	tkvoKw5vejsecU8BU3OqO7/WjDyp2r4wdtZa53xdcYpQp5Enrv5fPXhS6lbw==
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr19332078a91.54.1795620277304;
        Wed, 25 Nov 2026 07:24:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id
 98e67ed59e1d1-3b41cb20e66mr19332017a91.54.1795620276536; Wed, 25 Nov 2026
 07:24:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
In-Reply-To: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:25 +0100
X-Gm-Features: Aa3M54o8dqLPD5uB-WeLwhOdO6CQFYha7MYFNep3S3olWqjH0jSGnIbrJ4DpKTk
Message-ID: <CAPx+jO8hTrAAoZgJKK91yF9z3CaiB3w4DRvvgDz=Zm_zxU6g6Q@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: rockchip: Roll back power-on when leaving
 idle fails
To: 1579567540@qq.com
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06fdb6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8 a=dZbOZ2KzAAAA:8 a=bC-a23v3AAAA:8
 a=VwQbUJbxAAAA:8 a=mFHk9SUb-_LhEKcCAXMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: v7N2dQt7nERWzX7CCgYx15_MBel7i8pv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX3XmdNKCqCJQR
 IuVm3FbL5oiGi/okyw+AJuEEPdHTqGJswCntbxjyeSuzbsOatLfmPoYN7ChGEJnGJxB34twyCqi
 IjvxzfX7mRI9rNtOBx2NIyjivampRmeNSYDudB/8qqTNm1+EulF9+nWjxTbqyfqipDcmwveRr/V
 sdHFOzmtYVyTIpQ0aZ9QAKcy5KrDPFkOBqBccpaD2km5uFSUBpKZqsgb9gTk1SKlFU+mjLakztL
 6NUxWZ4SKxt1jqhFcxcr7nGjiTXk32+VgNl+5Dre9A7FV3tUuJVnhSvno/v1aO/muVeSJOOl9al
 FOAwihGdQa0mGgkAzeJwT5Lyd1QcFGvqyLN5wYVSJZpZaiaTcMxlI2DhNrmgPiR0eYTcyC7haNH
 zB57qtwT3Ga7ManKxiqa7q43/qiGT17+AD2SU64GytpKNXv/UKt+CVEKGDB/jhJu3CBU7c8FOIb
 4yIgAdDQ4DPxYdN9HWA==
X-Proofpoint-ORIG-GUID: v7N2dQt7nERWzX7CCgYx15_MBel7i8pv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX4nwFTe7DJ3VK
 CAnliQFTnZt1y5kdh0VC4RAf7KwJ5xzt6rRKMUbml4zpobAKYW2EgaaBc74obLZ+uqwBPjhIHBx
 hsyUMNYB9z5jgGPRe51VwTVTICAnJkU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_072439_966679_7A24D755 
X-CRM114-Status: GOOD (  35.61  )
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

On Wed, Nov 18, 2026 at 10:03=E2=80=AFAM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:
>
> From: Cunhao Lu <1579567540@qq.com>
>
> When NIU idle exit fails after PMU power-on, clocks and the regulator
> reference are released while the domain remains powered. genpd treats
> it as off and may power off its parents.
>
> Request idle again and, if successful, use the low-level power-off path
> before releasing resources. This preserves saved QoS and notifies
> firmware while retaining the original error.
>
> If rollback fails, resources are still released and genpd may power off
> the parents.
>
> Fixes: 6b2690df3f03 ("pmdomain: rockchip: fix rockchip_pd_power error han=
dling")
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> This pre-existing idle-exit failure case was reported by Sashiko AI
> during the RK3572 mainlining work:
> https://sashiko.dev/#/patchset/20261022-add-board-ok3572-c-v1-0-0b0fd85a3=
1ee@qq.com?part=3D10
>
> If leaving NIU idle fails after PMU power-on, the domain remains powered
> while genpd treats it as off. The error path releases the clocks and
> regulator reference, and genpd may power off the parent domains.
>
> This patch requests idle again and, if successful, powers the domain
> off before releasing those resources. It preserves the saved QoS state
> and original error, and uses the low-level path to notify firmware.
>
> Validation:
>
> - All 48 host simulations passed, covering power cycles, idle-exit and
>   rollback failures, QoS preservation and error propagation. No sanitizer
>   findings.
>
> - Hardware testing on OK3572-C: 20 patched and 50 unpatched NVM1 power
>   cycles passed. Request-write injection caused native idle-exit polling
>   timeouts. The fix powered the domain off in 3/3 cases; the original
>   driver left it ON. QoS and the original error were preserved, and
>   retries succeeded after removing the injection.
>
> Persistent rollback idle and power-off timeouts were also tested:
> resources were still released with the domain ON and genpd OFF. These
> failure paths remain unresolved, and genpd may still power off the parent=
s.
>
> AI assistance:
>
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
> ---
> Changes in v2:
> - Rebase onto the next branch of Ulf Hansson's linux-pm.git tree.
> - Link to v1:
>   https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-rollba=
ck-v1-1-59a45783e33e@qq.com
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 6abef60a5b4c..2c021784316a 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -648,6 +648,29 @@ static int rockchip_do_pmu_set_power_domain(struct r=
ockchip_pm_domain *pd,
>         return 0;
>  }
>
> +/*
> + * The caller holds the PMU lock and transition resources. Use the low-l=
evel
> + * power-off path to avoid overwriting the saved QoS state.
> + */
> +static void rockchip_pd_power_on_rollback(struct rockchip_pm_domain *pd)
> +{
> +       int ret;
> +
> +       ret =3D rockchip_pmu_set_idle_request(pd, true);
> +       if (ret < 0) {
> +               dev_err(pd->pmu->dev,
> +                       "failed to idle domain '%s' on rollback: %d\n",
> +                       pd->genpd.name, ret);
> +               return;
> +       }
> +
> +       ret =3D rockchip_do_pmu_set_power_domain(pd, false);
> +       if (ret < 0)
> +               dev_err(pd->pmu->dev,
> +                       "failed to power off domain '%s' on rollback: %d\=
n",
> +                       pd->genpd.name, ret);
> +}
> +
>  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_o=
n)
>  {
>         struct rockchip_pmu *pmu =3D pd->pmu;
> @@ -682,8 +705,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>         if (power_on) {
>                 /* if powering up, leave idle mode */
>                 ret =3D rockchip_pmu_set_idle_request(pd, false);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       rockchip_pd_power_on_rollback(pd);
>                         goto out;
> +               }
>
>                 rockchip_pmu_restore_qos(pd);
>         }
>
> ---
> base-commit: 6f5c8ec9302c5ad8904dbdfe8cf2a538ff835572
> change-id: 20261101-fix-rockchip-pmdomain-power-on-rollback-c11e1014ef11
>
> Best regards,
> --
> Cunhao Lu <1579567540@qq.com>
>
>

