Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 10:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ReX7r5fk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eL4VUp34;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WMY0CR/E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=; b=ReX7r5fkNQoKobtFRdXg+kP+/d
	Uwv7vs6H7PHSPZQTL43eh1Hk9+qD5t8HXY3G+Gh3GCIgn8Tu00qpF0Sz7JAz+Jqw8+S8Z5WxkjV6m
	r6MShwSgNYhHRd/WJmRWcHkDjb5ebQC2njLlohFHmMWJIkz6q+QXeSVL/iy32SUTDlra++NkjADa5
	OmIB71nVD6m6ZRBS0WpMWH9WcPigUnP/CCqG4VKs6hc6KAspOKqZrmLB9mrwtfLDHVx+R+4eQ+1sb
	VHQ3C+usPDGBnGE3kxlMygkCjoH0krz7ANCjsTbP8zVHQQwjuU8/iZmGRtybZ05D3cvUp69gV9J6F
	8LzwCaIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHT-00000000M36-0pjo;
	Mon, 09 Nov 2026 10:07:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQMHQ-00000000M2Q-0ypm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 10:07:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99usgN550740
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 10:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nf+MlQRRU02Zj+IsiGjuFA
	yJlL+9git8jqurbSTs7uY=; b=eL4VUp34QYFisixZ60bqtqAD2BDZ81OOTR4qdF
	t0zZnPPoL3J6YBwBzSTECJeFot3o83i8Uxsuw1YLP7BwBNoDpBCV7SkxXH4syMcv
	q1CKQCSC1dgd+xZTRc+TcBCat7yrvzM66j1YMR/RjtTPYCRcnKttOyhE7EASbZU+
	dGmAvnF8VsyYHeuzuiv/bWBAqoPH1tv7yYIhyYkvzl2+jpg4+3UIPqC0v7RtbeZE
	FaOkL/xifYc6OMmT8si4Jd2GqoEE9uXPC75hoKkxRURKM7/LUYylrPtpCuXFTP/U
	2aGEDmvrZabbwlY4yschnZDDv5sXaoIGvnVlggBo3EaN/lfw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2n40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 10:07:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso572944a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 02:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218830; x=1794823630; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=;
        b=WMY0CR/EF+34rjOZtC9qr0i54AI8ECV47RLHG3NqVNnaPuIr1K8dVckDkBUkpVeGwU
         IzatabxoXyFjqvYfxoRy1Z855p5DDWzD2iyyhqtdCOyoHyo4w6HXxT1S8Xc3Mx+A1HVj
         hTkxLUTrJS0O9pAhld6bo4e9tK0xXPi9abpBuF4FVte7JsQqsVO44tnXl9c8HFheq+ZO
         TJbnmOFiBCDphQ6KW494eR3IaP31BMbKrsYsFc9KA30RbBSl2yTwUQnabkD8FTqD/mpg
         BVgAtjbz7Dt47igj17nd9Jv2O2c9nmSDjRv0cO6MzIasv9s5Z0V0CMu12uW29mwnyzhF
         zEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218830; x=1794823630;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Nf+MlQRRU02Zj+IsiGjuFAyJlL+9git8jqurbSTs7uY=;
        b=dEII3dtz4XnOgAjnZVfl6Do0oiGn1qYI0TMlpqCrnOhWZe931k0cjCGv/J2Cu69eeD
         id3mgLeG17EsgZtcjDxYb4KKYarNFImhdItOHcTYBkJ1zCnfdkxaLqOJegFn4nH5lCMt
         L3urzoYTNOGvFa6JB4h/2pFPCYSbEX2tYtmFsp8rWRcf95MgYcbzdvJGk8W24U3mTUD6
         C4EyXr69U176v3PJBlGU1lTVRfWb2w8S1aGzW/HLnPkPXvcy4pF5WIlJrSYFibOekGtk
         kppEnfWUIXfiD/4M8m2NX6lQ0GCW2sueaYGPqmLRJW9hmyTRQyPvOegIDkyGJtk9x8ld
         NcUA==
X-Forwarded-Encrypted: i=1; AL+hErGrFccRPCfbI1AeVgnrxQxM7CZJndTftVZYSbU/4AYpsb8DSSeiS6fwYI663SD4GAldpe6o8IBpG7kdXTz8bgeo@lists.infradead.org
X-Gm-Message-State: APuU4Z/Be4JzaGBymBBvsbjmIGJ43M4PLa4dbdaidt/bRuJVhweEcROJ
	TwUeDzMEDd2qqeUv1Q8thpgIfqgXeNo8vvdSI0stnpmpXEcRMVSTp/davCt7LQj9sXZcdyz4l7l
	aJdNXL7J1FWhvGIxLllJyGhQc0jINhREr/SDPpRTApms3xP0kbQkh+gXpPnWGfm0pGzdc4lM4g1
	rC+g==
X-Gm-Gg: AYBFou3ytYvvkhXV5xvgzaZvRMwK1+aBLwkg6/2Rw66OEdedvb0MwhDpKDDpr25jgFW
	Rmunmt+wRsShn8IkJiuYj+P2r7mntXIKAzEew7elWwFKXvPpQrMJBLjabgiu0jbr2kVow8FwUCK
	qKNhSJNWuM/ISfNU48aqyKhOg4FpfiGED73ia5LQ+ItEwNqJCFlQ7I75vSahITyCQSH2Jp9/dJW
	HrSIG66PAul0pXVQ3p7P+ZOKUGal6vl3vfAWnRVpTV0mP4Rp1WpXYYYMkxWHjlIHJsDUqGg4Ohq
	ODnBjv5lKssdKWuplY0Ck/q5jUCHDFYRp2CifnBq59velzLEiCz+L8C+SoMiGmYHnypj4aAS1Lx
	axMXyHlCubux1TFJDSrutVHpyuttNpRiT506abWBhTRAYKfnMqK4ocGCDylFubTAK6SUbSMXqj+
	FS7p6vH0XmREbE4YzyTYRj3djM1yEW
X-Received: by 2002:a17:90b:57c3:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b12d30429cmr3355762a91.32.1794218829911;
        Mon, 09 Nov 2026 02:07:09 -0800 (PST)
X-Received: by 2002:a17:90b:57c3:b0:3ad:1b0b:1246 with SMTP id 98e67ed59e1d1-3b12d30429cmr3355724a91.32.1794218829365;
        Mon, 09 Nov 2026 02:07:09 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:08 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH v5 0/7] arm-mpam: Add basic device tree support for resctrl
Date: Mon, 09 Nov 2026 18:05:32 +0800
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPaa8WoC/4XOy07DMBAF0F+pvMaV30264j8QCz8m1NDExnYiU
 JV/x24lYEHDZqQrXZ07F5QhecjouLugBIvPPkw1yIcdsic9vQD2rmbECFPkwCkeox5xgmxLOmN
 X8NsUcZ5jDKlgS6Wzlmuh+w5VISYY/MdVf3q+5TybV7Clka1x8rmE9HmdX2jr3ZY6ur20UEwwa
 MX7gwHtZP8Yct6/z/pswzju60FtcGE/ZE/FNskqaQalhDSGDUreIfk3SQnptkleSS5prywzgpv
 hDil+kewfUrQvndMUhJDW6D/IdV2/AL7kFUvYAQAA
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>,
        stable@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218812; l=7292;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=LA1+ibIXeIVXpuJ+TURQUTmYGYdOyRJdkXgKC0FlaS4=;
 b=cl8Ypml7zZTIO31d7GTXhuJJVazzEoUpVVKwNkvQAK25ZYUX7Y4CTJ2OTJP/AVxoyS4XIItsU
 zm7H3GY0SnDBJLCtaBN5NH3OVMCCKCfXHCb/7GD7yvZ8019QvRvreJm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0dFnsRjvPPK/
 MudqcA06mLL7VPms2enI0vcpWLwa1v05lY9xztVzl0KVpYa3G0P5xS5NNaKIzGm7MgFtTpU2Dx9
 lBmzOACRC8/50FQitcOc8XuziOURteQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXwbw3k3IQspwN
 vAbwBzKI0cARsucZYC1CEmNs8SwsMqfBAgdsmGPDxsk6Zh+B4NDVR5qmes1YwQcRysqQ+nz7dn3
 hrLtpaQTlnnSBHQCeFJ/RR9Z/mykkz6UIXbgcZIypW44d9et48I6UpE22dT6KuKqmRmbJZ/tXIW
 E8UcLOuNG77KsNg9fp4atQlErBe8tcwxHTICINfaH85Ip9zeOAyDK045Q/qjeD4Bu+m1X2/bSYE
 n33ZZkMYddlUen7veGKDXPjI2NvO8Q0/d1qMcoWewg42u9pNrbSfsSwAiFdufVy9ZtV4ImdIEpb
 5gJsNdpOpjFF8OPelEqiKe0db3lmk/FkxLyi9tDcaxgW6phpdktBWN0ktygK1Ycml/gXjcvf+uZ
 Cr3OaIR+0gFCS6vpWgOY+JltBdlutNW+dVZ5MVzthh67+ZQO/D8zU+dlvutv77Cx91Pect+DvAf
 yEi+VKZECqxvg+9ci6g==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af19b4f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8
 a=omOdbC7AAAAA:8 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=zO7xiSDGFKMmiMMs5ZgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: WUjNcwQ65YPHoqKT38C25YV-WxN2cgbJ
X-Proofpoint-ORIG-GUID: WUjNcwQ65YPHoqKT38C25YV-WxN2cgbJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_020712_396198_A4D8BA9E 
X-CRM114-Status: GOOD (  20.76  )
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support before it can be enabled on
DT-based platforms. This series provides the foundational DT binding and
parsing support for MPAM.

The verification platform has been updated from Kaanapali to Nord.

The patches are based on earlier work by James Morse, Shanker Donthineni
and Rob Herring, with fixes and additions on top.

Standalone fixes to existing mainline code (placed first, independent
of the DT work):
- arm_mpam: fix the RIS index range check
- arm_mpam: fix the MSC MMIO window size (off-by-one)

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

The verification platform has been updated from Kaanapali to Nord. The
Nord DTS patch adds MSC nodes for the L2 caches as a local verification
example. The MSC register size is 0x2000, as the Nord platform implements
MPAM registers up to offset 0x1FFF (permitted when MPAMCFG_MBW_PBM is
not implemented).

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
Changes in v5:
  - Restore memory controller MSC support: a concrete platform user
    (DDR egress MSC) has been confirmed and verified on hardware.
  - Update binding: restore 'arm,mpam-memory-controller-msc' compatible
    and add a top-level memory controller MSC example.
  - Switch platform DTS from Kaanapali to Nord.
  - Rebase onto next-20261014.
  - Link to v4: https://patch.msgid.link/20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com

Changes in v4:
  - Reduce binding to minimal set covering only properties in current
    use: remove RIS child node support, memory controller support,
    arm,mpam-device, cpus and interrupt-names.
  - Drop memory controller MSC patch (no concrete platform user).
  - Drop RIS accessibility patch (no concrete platform user).
  - Update DNM Kaanapali DTS: fix node names, compatible, ranges/reg
    format; use 0x2000 register size reflecting platform implementation.
  - Rebase onto next-20261014.
  - Link to v3: https://patch.msgid.link/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com

Changes since RFC v2:
  - Fold the binding schema/example fixes into the binding patch.
  - Fold the foundling MSC fix into the DT support patch; remove the
    unnecessary parent cache availability check from
    mpam_dt_create_foundling_msc() to keep it consistent with
    mpam_dt_count_msc().
  - Remove the #ifdef CONFIG_OF guard around the cache_of_calculate_id()
    prototype in cacheinfo.h.
  - Remove the [Yin Li:] annotation from the cacheinfo patch.
  - Rebase onto next-20260918.

Changes since RFC v1:
  - Fold fixes to inherited patches into their respective patches with
    [Yin Li: ...] annotations, as requested by Ben and Andre.
  - Move the RIS index range-check and MSC MMIO window size fixes to the
    front as standalone fixes with Fixes: tags.
  - MSC MMIO window size: genuine off-by-one fix; the ">" bounds checks
    include the access width and are kept as-is.
  - ris_idx: validate range after of_property_read_reg() and keep u8
    downstream, instead of widening the call chain to u64.
  - cache-id sentinel: keep ~0U notation, leave cacheinfo.c unchanged,
    replace unsigned long with u32.
  - Convert mpam_get_cpumask_from_cache_id() and the cache/component-id
    variables from unsigned long to u32.
  - Fold the device_node refcount fix (of_node_get()), reviewed by Andre
    Przywara in RFC v1, into the DT support and memory-controller MSC
    patches.
  - Drop the "clear mask on error" patch.

Previous versions:
  v4: https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com/
  v3: https://lore.kernel.org/all/20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com/
  RFC v2: https://lore.kernel.org/all/20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com/
  RFC v1: https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com/

To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Ben Horgan <ben.horgan@arm.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Jonathan Cameron <jic23@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>
Cc: Drew Fustini <fustini@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: Ping Li <leeonion.muyu@gmail.com>

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (3):
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix MSC MMIO window size off-by-one with resource_size()
      arm64: dts: qcom: nord: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      |  62 +++++
 arch/arm64/boot/dts/qcom/nord.dtsi                 |  72 ++++--
 drivers/base/cacheinfo.c                           |  17 +-
 drivers/resctrl/mpam_devices.c                     | 278 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/cacheinfo.h                          |   1 +
 6 files changed, 389 insertions(+), 43 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>


