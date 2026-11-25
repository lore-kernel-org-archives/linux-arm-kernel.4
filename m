Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B08606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YB3ddhuY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nzjcr1Jv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwk9nmIY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F8Fmq8LWA4bhtyNOLWl2S9LNOHs1l6eqA9F+R8NUX+A=; b=YB3ddhuYpJuSmS
	V/nJy+pme+mp7u8wvxVjYE4Auot4mbz3JKue3gxoYwai/U/5MV+hfUC6+UCfNxgkG2g9P/eSYtzKi
	rvCdNBt+gv+Nz1rS8yjDIiisL1O4U2B0oLFVXzv66yw1YZ1V7EFEkcA+j7AykEzAWqYM/K/koieAc
	8aF8j00CafUDJuFSTHsiNO9OatQ1pihRpJRVBO8nIfKCN39Rgk6eon+oqnd6zi6xL9cSLeljBi9ph
	arFgotJael+HhMmnpAqlQwLbqCL0PjqP4LTSeXbkev49IgLRVX4TP9Hx3h0aYp93/KE90t6aUNzUO
	iZP1vWfBQk2K2zQvPEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEZz-0000000AI9d-1m8O;
	Wed, 25 Nov 2026 15:06:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEZs-0000000AI8B-3bxG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 15:06:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM14D1395966
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F8Fmq8LWA4bhtyNOLWl2S9LNOHs1l6eqA9F+R8NUX+A=; b=Nzjcr1JvAe8O3y2M
	nRk02gsmzckXBcRxfri+XHtkdUIEszeIzfFyQQgR/BocgtLFL+n+eCBxHRzQ6Yfq
	qFzg8RINXEMwOvBf0/oUkncHMiBTksHiHC9BqK7fPOJQt+fer1msKMHomuVFo02M
	HWlOZeJFWN/NORls8UyWol1U9y/9hHAW4fZgccoU7/Sbqi2bbTFG+4vjo+f4z3En
	x0PMMHwz77Py3aOkFJX8N0yFo4LC9oqXKJIiDzifeX/5Vv+KdoJ8lIpcubq7K9D4
	SMLEBhZdEr0PMudXVoqY9KyOzziQXsPFG/RnejlYfRIxAoE94rHnRlkzkztqvvLf
	0Vovvw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6ru90f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 15:06:32 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdea3a64d1bso1519694a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 07:06:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795619191; cv=none;
        d=google.com; s=arc-20260327;
        b=ofy/zVtOxmtaWEhhT5nwlhAYwJ339fMyEw/AuC1rSglH89D3S+04oQNllXeg0fJG4R
         ZI+kgOECNO7hQ8O6BFaNOZUDoMlqW6glPVxHAOkqGhRAIhYmawebfOx+TAPz7oNIgBBC
         atr/kyHmNxTsZ3btxFehzW/KoRPSfsPdl8d+dnD3ka1pZJJwHCA+thRRKR2c6Dr3CF4E
         AUATD6G5gWyqJEIVfxf0ISzVLDgZ6P/jZXWowp8xmc2UsjOHo074UKnRZxB9E7cFcgTa
         JuLmcTFbNsULECTTvdLnO8vasw66k/xxUIL0q4ij15LZ5QCExhjCyZrRe02vruez7q3+
         azpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F8Fmq8LWA4bhtyNOLWl2S9LNOHs1l6eqA9F+R8NUX+A=;
        fh=0zZVQNwWc0hnMxMEa4+Z1sDBgdO77gWzXL0r5svaXG4=;
        b=lIEKqTlQhMNNa138VbfnH/Uj4L1pLNTeLsXbZxsxIgrhl4JZFOf8JIzT2k2gzKV33E
         OIUizqtM1rGA6CwVFQ+iXVhBcxPekvTO3B66YSn3Qif9mvWqjvNMhzISwYzc8VWbWU0s
         3VCvZ9Vs0mp2pm7EksAXBYSM8LbyojIsvTdkLwhtadZOXZmOyYFGCscECwK/A0y1l5ZV
         Noy443EW2pqxQzypLEO38dRnJ5hwzJ8f5XVU691h0AYTqlWBTxsL7hdppj55dd+0FV4J
         WK9/Rt4Ts5fljqg/Iw30s10i1R0f4kVQ/lBTWfwf1SWQt+zGBZPhhOWBfHN+BhDatY72
         iWiA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795619191; x=1796223991; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8Fmq8LWA4bhtyNOLWl2S9LNOHs1l6eqA9F+R8NUX+A=;
        b=cwk9nmIYQJAHl2jbOSBVgOxVc8cHRp+07hKQpB+zTILSb/C1BINmTKwu28BnDCmb3j
         vVjH3lI/46nSUJvh/W3WpiaWou7aGr+iXRTHH5mry5wE+2/H7e7Iavu6rGduhS9Yb1B8
         ovCgD7VIloarfyjUf7FiU/F0dWi3KfEJniur9KPAvFIkhwJGTsw3i9dSR9LeYXSFqTAT
         1cPRe/So7Oesx7H4+AInmeBDLNcb8qpYGQxMyi+Wf2rnye/Op1ePSeCw1BmLm0hhAZ36
         /qC2NGLYz3cSbRXPrYkToaFpE4lFO9qH/OWW8WCK/Fj2wKJjpeWxYH98iFy0EyZskrfv
         0zrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795619191; x=1796223991;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8Fmq8LWA4bhtyNOLWl2S9LNOHs1l6eqA9F+R8NUX+A=;
        b=MmBTA4u7cS1Lfw7oD7kNNoKx8xmk0lyTsdXZBRiknreBOzPQzGBFXvNjvOEd2pHf8P
         0jQ7R0kdtm6waj1Y/whty7K4BzmaWqXda3q8T1JEi3I+5AMw4o5Ib2bNJyxe8jpkjRJZ
         MfWB9syfa14VIh1qBFA9a6J6YnqyDSP6GIpFE0FxHXReIufUAWpv3LHGXwvhJHb52joI
         ACKOlnR2yGgV4YCTLOmalgnwBlauMyNva9Sg1QF0l/WmnAV0g6E/8Nx3OfyWjmiVnEAZ
         kDP25RJgl3vDoR2zpQC1zxBWUge+s1rWK9aiBRbe2QAz+gyoZ1c97LQkegj6fnBh3fX8
         z2BA==
X-Forwarded-Encrypted: i=1; AL+hErEi5KiLRxqZW5mqZitmsl3mXcWpMy2vk03iTvmHqRitwoedjyMkCtWQojP7hOi86HWMtMijzQCA4oxUF0wxebq0@lists.infradead.org
X-Gm-Message-State: APuU4Z/hPdKOSmZsUGELEMUucdvGv0CTElHlolErQ9y1sGmZExGn4JcK
	F+sm2lyOSaE5eY0peqJSDdmuFH9NIcWHxhZQjM6uowjHEp6cMI5C86xdyhpkXkT7CaCEJ0P0u2T
	YdIzelPWWD6U4GOdubTk+/GXoAplpS3tSjB3F8jveMKu2NQLvuHcnB4+jFthNJ96QThvdQikqVZ
	AaZmd3m0saUJFm4z8K7MReY0mn2MvymZbs3EOEZM/B/1aA5dz41ZFx
X-Gm-Gg: AZFdTZcKP/KBCRasnaNizIFc3LsRQEAJ5pNgEJExWXV6wnJn3aD4td+9HmHaGO9AzWl
	O9i3mdoI5ugdkMi6BOjjw7Sv0rEm00UVl7yUBYfepcoebqVIDvoegQQfqNhCEdLcIXflhG8tJzy
	Ed2p5NMCgNSAk3s5YQ1ktA2WRjhNEZTtE3DKQTddPUjNpBHQ5PltXa7zRQSw==
X-Received: by 2002:a05:6300:8095:b0:3dd:a196:69e4 with SMTP id adf61e73a8af0-4014d14d2d3mr16907612637.63.1795619191496;
        Wed, 25 Nov 2026 07:06:31 -0800 (PST)
X-Received: by 2002:a05:6300:8095:b0:3dd:a196:69e4 with SMTP id
 adf61e73a8af0-4014d14d2d3mr16907537637.63.1795619190966; Wed, 25 Nov 2026
 07:06:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261117173738.1073856-1-Frank.Li@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:06:19 +0100
X-Gm-Features: Aa3M54qxdRmYOsZoBrTl4IfLXTc7pY51UNG7OdOGBQV2sjgdmvbFz8dtj3UY-KM
Message-ID: <CAPx+jO8oqBcGCSUReJJVMjsnQg+xCv_X8LhFVaGk0NDuOqmEiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: fix stub pm_runtime_get_if_active()
 for !CONFIG_PM
To: Frank.Li@oss.nxp.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Alex Elder <elder@kernel.org>, Guan-Yu Lin <guanyulin@google.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>,
        Maciej Falkowski <maciej.falkowski@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        "open list:POWER MANAGEMENT CORE" <linux-pm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
        Frank Li <Frank.Li@nxp.com>, Alex Elder <elder@riscstar.com>,
        Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Matthew Brost <matthew.brost@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX+BHWqF9NN9ro
 8OkNqxxB92nV/vtBqCNXmGwLis575U6mWxiHrkepkEArLeKY5O2VexsBXUCXX3xZk1JgZ6A1mY4
 39BNEqKYoJ9Yl+msHWmmjjIQ03UBFyDoOZ/8j5KOssVrMtEI+yEls1aLu7Enofe42xnpBtSExSM
 98g/USeRMMxngTgtMQQt3vyVTj+CZVCua3GplV3RLTBddEKkCEzg0iFNe2wLHGHQICy9m7+5xYu
 2wVKbGbG4oosu7CK0ypov9AwnhOH0DpkAxPbZ3EaFYGQWW0uADKuX+iTPk02xtB8Dnajz805qoN
 YoHbDofXNJzLm3N0NmNfH7HLibKeXsgAzaPl5Cg/RacQSlNidmmrmPZx1tJATXqlJl18FcMgfkx
 sSrwFDa7JyrPgGMWeO79Z7d2QaIgUhky6Vtg+OnpTEAkkyiCcWO3KzrX01u+L2Ng8xSq54Qfvhf
 SN8s1CqdmNxzkjFtIiQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06f978 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=8AirrxEcAAAA:8 a=ee_2aqc6AAAA:8 a=VwQbUJbxAAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=GFqr32JmAAAA:8 a=pGLkceISAAAA:8
 a=7CQSdrXTAAAA:8 a=tA7aZXjiAAAA:8 a=EUspDBNiAAAA:8 a=_jlGtV7tAAAA:8
 a=1XWaLZrsAAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=f3U7k-wd2kzf4Rf19YkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=ST-jHhOKWsTCqRlWije3:22
 a=VOpmJXOdbJOWo2YY3GeN:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=f02Ha7HRcztGgdyUxOxW:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=kIIFJ0VLUOy1gFZzwZHL:22 a=nlm17XC03S6CtCLSeiRr:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: a8blT2-WhUhpVCHL8hFI92CEo3t_1r8P
X-Proofpoint-ORIG-GUID: a8blT2-WhUhpVCHL8hFI92CEo3t_1r8P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MCBTYWx0ZWRfX6aa1//81Brgx
 Hkv7ZUkXatrnJjWkHlwO/U42ttO34odZ/+wOEW6bVp/xqjYr+Nxy5RLjzmiI5Qip+kNYtIxuTDb
 lidPi0wxuVP2cZ10OiPVFtqWsqu+fas=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_070632_912011_DFF6BED4 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Nov 17, 2026 at 6:37=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> When CONFIG_PM is not enabled, should be treated as if runtime PM were
> enabled for the device and the runtime status is active.
>
> It's a subtle distinction but the previous behavior returned -EINVAL, whi=
ch
> means "runtime PM is disabled for the device"
>
> __pm_runtime_resume() returns 1 (called by pm_runtime_get()).
> pm_runtime_get_if_active() is the try-and-get version of pm_runtime_get()=
.
> stub pm_runtime_active() also returns true. So pm_runtime_get_if_active()
> should return the same value as the stub pm_runtime_get(), which is 1.
>
> Analysis of all callers and their behavior with old (-EINVAL) vs new (1):
>
> Pattern A: if (!pm_runtime_get_if_active(dev)) -- no impact
>   Both -EINVAL and 1 are non-zero, so !ret is false in both cases.
>   Callers: drivers/accel/ethosu/ethosu_perfmon.c,
>            drivers/gpu/drm/msm/adreno/a6xx_gmu.c,
>            drivers/gpu/drm/msm/msm_perfcntr.c,
>            drivers/gpu/drm/v3d/v3d_mmu.c,
>            drivers/gpu/drm/v3d/v3d_perfmon.c (x4),
>            drivers/media/i2c/gc08a3.c gc05a2.c og0ve1b.c ov6211.c,
>            drivers/media/i2c/ccs/ccs-core.c s5kjn1.c lm3560.c (x2),
>            drivers/media/i2c/s5k3m5.c thp7312.c imx283.c ov64a40.c,
>            drivers/media/pci/intel/ipu6/ipu6-buttress.c,
>            sound/hda/core/device.c
>
> Pattern B: if (!ret) after get -- no impact
>   Both -EINVAL and 1 are non-zero, !ret is false in both cases.
>   drivers/gpu/drm/amd/pm/amdgpu_pm.c (comment says "allow access"
>     in kernels without CONFIG_PM), drivers/pci/pci.c
>
> Pattern C: ret > 0 / ret <=3D 0 / ret !=3D 1 checks -- FIXED
>   drivers/usb/core/offload.c: checks (!=3D 1), old -EINVAL caused
>     -EBUSY even with !CONFIG_PM. Fixed: now returns 1, proceeds.
>   drivers/accel/ivpu/ivpu_job.c: drm_WARN_ON(<=3D 0), old -EINVAL
>     spuriously triggered WARN. Fixed: 1 > 0, no warn.
>   drivers/gpu/drm/i915/intel_runtime_pm.c: checks (<=3D 0), old
>     -EINVAL triggered error path. Fixed: 1 > 0, correct path.
>   drivers/accel/ivpu/ivpu_sysfs.c: (> 0), old skipped freq read.
>     Fixed: proceeds correctly without CONFIG_PM.
>   drivers/gpu/drm/xe/xe_pm.c: wraps (> 0), all xe callers
>     (xe_bo.c, xe_shrinker.c, xe_vsec.c, xe_ggtt.c, xe_guc_ct.c,
>     xe_pxp.c) now correctly treat !CONFIG_PM as active.
>   drivers/net/ipa/ipa_smp2p.c: power_on =3D (> 0), now correctly true.
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c: (> 0), now correctly
>     executes stall register update.
>   drivers/staging/media/ipu7/ipu7-buttress.c: active (<=3D 0) early
>     return now skipped, correctly proceeds.
>
> Pattern D: explicit -EINVAL check
>   drivers/hwmon/prom21-xhci.c: checks (> 0) then (=3D=3D -EINVAL).
>     Old: took -EINVAL fallback. New: takes (> 0) fast path.
>     Both succeed when CONFIG_PM is disabled; functionally equivalent.
>   drivers/hwmon/eic7700-pvt.c: call is guarded by IS_ENABLED(CONFIG_PM),
>     stub is never reached. No impact.
>
> Fixes: c0ef3df8dbaef ("PM: runtime: Simplify pm_runtime_get_if_active() u=
sage")
> Fixes: bd3d245b0fef5 ("usb: core: use dedicated spinlock for offload stat=
e")
> Fixes: 7806bad76ac39 ("accel/ivpu: Prevent runtime suspend during context=
 abort work")
> Fixes: 1524c28b99527 ("accel/ivpu: Show NPU frequency in sysfs")
> Fixes: 46edb0a3eb16c ("drm/xe: Fix xe_pm_runtime_get_if_active return")
> Fixes: a71aeff3dd0a7 ("net: ipa: kill IPA clock reference count")
> Fixes: 70892277ca2db ("iommu/arm-smmu-qcom: Make set_stall work when the =
device is on")
> Fixes: 9ad65684b9285 ("media: staging/ipu7: Ignore interrupts when device=
 is suspended")
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Ulf Hansson <ulfh@kernel.org

Kind regards
Uffe

> ---
> Change in v3
> - fix drm/xe fixes tag hash (sashiko)
> - drop i915 fix tag because guard by CONFIG_PM (sashiko)
> - fix net ipa fixes tag hash (sashiko)
> - Add c0ef3df8dbae ("PM: runtime: Simplify pm_runtime_get_if_active() usa=
ge" (sashiko)
>
> Change in v2
> - add fixes tag for patten C.
> - add Alex Elder ack tags
> - change subject to fix stub pm_runtime_get_if_active()
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>
> Cc: Karol Wachowski <karol.wachowski@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: "Thomas Hellstrom" <thomas.hellstrom@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: "Joerg Roedel" <joro@8bytes.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Guan-Yu Lin <guanyulin@google.com>
> Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> Cc: linux-pm@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-hwmon@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> ---
>  include/linux/pm_runtime.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
> index 64921b10ac74f..de9e7518ecef2 100644
> --- a/include/linux/pm_runtime.h
> +++ b/include/linux/pm_runtime.h
> @@ -280,7 +280,7 @@ static inline int pm_runtime_get_if_in_use(struct dev=
ice *dev)
>  }
>  static inline int pm_runtime_get_if_active(struct device *dev)
>  {
> -       return -EINVAL;
> +       return 1;
>  }
>  static inline int __pm_runtime_set_status(struct device *dev,
>                                             unsigned int status) { return=
 0; }
> --
> 2.43.0

