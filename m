Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB80606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gwZXnAGv;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WLS6eO1W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AgpFi0HG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=08OZORRcrcIF2Ty+sn3CWx4/XSYv/+hAVznOdrM2vx0=; b=gwZXnAGv8BmWvUlo0swJ6kROo9
	P2oEBF0P610NDdSEjkKY+w3Pg0JQQ01cmyx51cVwRgLdgqZHlcrzXhqqMuvM0yn0pimZ5xYRAL5mX
	DKEHO/JPeyDQg2c99QvNcMlQ6pNyf/DQs8yUT0aA7amL26yafw1gKdg9P4100UXKMMvjm+uX4ie2q
	4AvC+mE0BBQf5MWbT54TciyV1LCNI1ayUNZePBSJ6LNqwWgPT/mVXjUojEbYHrJmIHu+LtS4fey+s
	ApMwY0albcvDROmtC2vCrEbG+a5pulX2qLRf2YEvwkGYwwdIvGl9Ukoyg3MzenCYmhiCRQmGbmnEC
	COj6ChMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUok-0000000COJr-3ps2;
	Thu, 26 Nov 2026 08:26:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUob-0000000COFm-2tei
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:26:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7OL3548440
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=08OZORRcrcIF2Ty+sn3CWx
	4/XSYv/+hAVznOdrM2vx0=; b=WLS6eO1WUscobvNqvXnQYhM8FLoWi1OatGlVQI
	k/dFFEJk/rskX8mIgC7r20iS2pakzRlO/w1ZrVyfZlsmqjWvTwtM+90kRsUtXKz1
	5M+JCJQ7g1Eeti+XQkoeK3GaKJWr0C0mjbbF2j05G272PUAGdBxJwLsKvYK0SCfp
	+Ao0hdvPVvA9hAKN859qiIMv1jdWx4+w3OzHn0WB+EKNaxfa3gcIIrMXlgF0ef+o
	w0s+3W71mZJD/G7HkRp+5jBS7uEh84gQoe3tj93SVHk9iI7hpp6zWAyacFJcFh50
	ePkqCJ77g/XFulC785RKiC+00Y/MVh5iRYV5QgeYx/nZi5hA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vau0p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 08:26:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3854627c1c8so9280342eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681608; x=1796286408; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=08OZORRcrcIF2Ty+sn3CWx4/XSYv/+hAVznOdrM2vx0=;
        b=AgpFi0HGHNJjAuBj0HVUPRvIutH3W2rqknQndNsnOLWTAYuY89WtHY6SQJSZVh2pg+
         mAJ17iW5jjmjZ38NxSWACu+WyL3z46spIPBJfLg9ufIQFcqBI7G20vGW/quDiKrIkbLM
         1TffSRgUI1bCoBKT110Z8RfK+uh59hRsmnKh39YIc9gs4ht5BvAx8vy7kmAvFzK1Sziu
         /vLrGQ+rGx4lctzH+eJ0fdBv2YCakAmuaugoJ3ByWRpo+MIhDp1xd3TilSEpGi1XOo1A
         vBnXROsqe9Z2jfvdQSauKss0hmdqjWY9oso+TIZan7VUasBRWuVgh6yg73LYPr+Wm6MJ
         QRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681608; x=1796286408;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=08OZORRcrcIF2Ty+sn3CWx4/XSYv/+hAVznOdrM2vx0=;
        b=uK7+NHGF+vpj2fdwf+h9NHSSmnslEyCBW4EDrVH3mEgnPN+Fx5OirZabSQEQW8ZfLs
         6ZRK2eQf1txJ/0FuUKvcJzwabmfJc+OxBMf0tpsV7jiygV6AmQyW6XIuQ/4FYQY02z/k
         amvHd+B76veg+EEMQU44mVpTVdXM/LOGUhfFD6EvZ7Gda3htYku0x+4lCwO1w8Ie9JuI
         PKWjWo9bxFzYqjDhraM0A4WpG7HnAMMx7QRpXedXSi+ss7S5sLzcWiRGWm7nPEqwvSsD
         aBF7MsAlytY9/23szbbzHJtXg2wvpi4EuwzgRH/RUQtXVJtNHjN266j51Gtymgk/VKiF
         FlMg==
X-Forwarded-Encrypted: i=1; AL+hErFcioU9fiax9sGbVrrlMneBVC6r8utWFxeHhPioufJkV2FOaR1KhSyE1abGtqZIMHbhVNadk/0zUMGnVSM4y7+F@lists.infradead.org
X-Gm-Message-State: APuU4Z866ERNqmZvQuMEtwzXMwYqUGRI4S9gK0j09/NJPfSpow8vyhvv
	b5v809XOAOjZ/0FX/RLXl2rat075D0t6itmSyHUocWZNLBHadfZEhYPAfsr0SyvbKT1644DVbu0
	a9ukYmRlx68jo0DI5F5nDb1GpqqTdF6nO/mm2mql+Uzj5aaFF9cGEe9YEtaR+azo8zOFqzxPo9p
	OTxQ9hxKnoWg==
X-Gm-Gg: AZFdTZeDF3NV2+w3VXxJ9Hz/5L1AqhFgnY7PPm006mlcjUWpAkBvfjwxiKZJ2mtzvoH
	N80oCbQl09Tpv+oBhRv6NBMn+o4xkj8UfKbWXLeIHO1ly9hNPJ5pKQoTN46sDO2GGaJ2BMSGVrf
	wWL9wzzhOoISShahu06FISwfRsVLQX2/vSYB5x8ozUtX0yM0wIAGsCyahLBF48wFpW4MIr0LUvD
	4QgexZNjiWVNctl2YRzcwxO60U1NU/xsgxNr0+XuFijgc7TMDkhoC2UssJhLWm0IZFw8V8uCzs6
	fOZUP+njekPLOJnxDHoMRoaiPlw53NMmi0nnHnSteWL+mSco+co+ogE7ShYKr8QMycO3D/zG10F
	MDQTWq2uyvsknKSX4iLoowb+1Ipqb1a9vBfWYX/XZK7rGHUJhMVrFM0Ahgw7Lr1+3TKB2QBBFKN
	zMNfny6q1eVk7F+fW4tQm/
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr18298117c88.19.1795681607841;
        Thu, 26 Nov 2026 00:26:47 -0800 (PST)
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr18298047c88.19.1795681606978;
        Thu, 26 Nov 2026 00:26:46 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm46350056c88.2.2026.11.26.00.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:26:46 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 00:26:45 -0800
Subject: [PATCH RFC v2] PCI: pciehp: Fix AB-BA deadlocks between
 reset_lock, pci_rescan_remove_lock and pci_slot_mutex
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-fix_deadlock_1126-v2-1-c0ed50bc7b04@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAETtB2sC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMz3bTMiviU1MSUnPzk7HiwiHmSZVKKaUpiSqqpgRJQX0FRKlAR2Mx
 opSA3Z6VYiGBxaVJWanIJyDSl2loAQOP/KHoAAAA=
X-Change-ID: 20261126-fix_deadlock_1126-7b9bd5dade50
To: Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Lukas Wunner <lukas@wunner.de>, Frank Li <Frank.Li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681606; l=12772;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=ZzSEUpv9PtF3JkDwBNC5Tunf3/kyG4FqNS8I4HF/Hts=;
 b=4Qv5+v8z0bwObSvYVi4EP0+KB5+72NYGb5KTmp+33PDmawvgPZdlLIeiXAiRaQh3mhEgF/00L
 dopDdE96jFaByX6XUm60LEQ3j/buW3IKZCqjO0oC6GT389YHMCdkra2
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX1/CJPfkUObEX
 qnsmnZVRbKBMTj8wACjXCLoyvIFpDWG9W+m0TOOk2NZGeg7gcSGzZosK1mbxVWarVBogsgCiYvT
 NYo6xIeo+afXv1Of4sV4AZN+Sx5vOvY=
X-Proofpoint-ORIG-GUID: pSw-kVMGkD4gh1zg0zjtisCCeA__tEbu
X-Proofpoint-GUID: pSw-kVMGkD4gh1zg0zjtisCCeA__tEbu
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07ed48 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wr20Ner3HAe7Lg71fTsA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX3nhyGgHitCz/
 cfffYPdNmAB27KWLU15k29DeO35PZtTZ8AG/vwcPnXMWmLEiFDqDdrmtZsi4etwcxwa1uy5KRFX
 OT40eT/3M5ssrnSvWLuxK9hZfk0iQ8ri5QVJuOqMbHq9HKm1KymQbkUAaZ2znj6+bc+Z44Ls2Bz
 Z+oWhl4cU+rFX4vHmmGq1D/dwkBXXoQOQL+ylmLMaM1yD4aIInTNv8sCy8a8yKAvyILhpTzjSp8
 gfLgnupuLPfrp0YA4shQTECfCxlHFSrCNJjrBAWr4BQOFMob6vTVfKwUBgFZ3+neFu9/mHElMcv
 IQxCiXOYlLJyLAX8uI7YfBaTVXpAm1U+7T/jN0oEB3J0RSRP+v5NtSxZvb+ardzKKkzo5pawVV0
 /rwnYDXwqYHgMCUOxQvy0mBHprXTikUjOaDJ7wJeqNEsFPT7a2vuA488vR1/n9S9N5LcBnAB6ye
 xUs6Uf1m6bhvVxO0Y2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002649_781928_814143AA 
X-CRM114-Status: GOOD (  24.36  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 5b3f7b7d062b ("PCI: pciehp: Avoid slot access during reset")
introduced ctrl->reset_lock to serialize a Secondary Bus Reset (SBR)
with the pciehp code paths that read the Link Active and Presence
Detect bits, both of which flap during an SBR.

pciehp_ist() holds reset_lock across the whole event handling,
including enumerating or de-enumerating the hotplugged devices. That
nests two PCI core locks inside reset_lock, each taken in the opposite
order by a concurrent SBR, causing two AB-BA deadlocks.

First, reset_lock vs pci_rescan_remove_lock. pciehp takes them as
reset_lock -> pci_rescan_remove_lock:

  pciehp_ist()                                 # down_read(reset_lock)
    pciehp_handle_presence_or_link_change()
      pciehp_enable_slot()
        board_added()
          pciehp_configure_device()
            pci_lock_rescan_remove()           # pci_rescan_remove_lock

A Root Port reset from link-down recovery takes them the other way
round, pci_rescan_remove_lock -> reset_lock (the boot path, via
pci_host_probe(), takes the same reverse order):

  qcom_pcie_global_irq_thread()
    pci_host_handle_link_down()
      pci_host_reset_root_port()
        pci_lock_rescan_remove()               # pci_rescan_remove_lock
        pci_bus_error_reset()
          pci_reset_bridge()
            pci_slot_reset()
              pci_reset_hotplug_slot()
                pciehp_reset_slot()            # down_write(reset_lock)

Second, reset_lock vs pci_slot_mutex. pciehp takes them as
reset_lock -> pci_slot_mutex:

  pciehp_ist()                                 # down_read(reset_lock)
    pciehp_handle_presence_or_link_change()
      pciehp_configure_device()
        pci_scan_slot()
          pci_scan_single_device()
            pci_device_add()
              pci_dev_assign_slot()
                mutex_lock(&pci_slot_mutex)    # pci_slot_mutex

An SBR of the same hierarchy (AER- or link-down-induced Root Port
reset, or a sysfs "reset_subordinate" request) takes them the other
way round, pci_slot_mutex -> reset_lock:

  pci_bus_error_reset()  /  pci_try_reset_bridge()
    pci_reset_bridge()
      mutex_lock(&pci_slot_mutex)              # pci_slot_mutex
      pci_slot_reset()
        pci_slot_lock()
        pci_reset_hotplug_slot()
          pciehp_reset_slot()                  # down_write(reset_lock)

The second deadlock constrains the fix: pci_reset_bridge() must hold
pci_slot_mutex to walk the slot list before it can reach
pciehp_reset_slot(), and pciehp cannot reorder that. As long as pciehp
holds reset_lock while descending into pci_scan_slot(), the reverse
nesting is unavoidable regardless of pci_rescan_remove_lock ordering.

reset_lock only needs to protect the register reads against a
concurrent SBR, not the enumeration itself. Fix both deadlocks by
dropping reset_lock across the whole scan/remove section in
pciehp_configure_device()/pciehp_unconfigure_device(), extending what
commit f5eff5591b8f ("PCI: pciehp: Fix AB-BA deadlock between
reset_lock and device_lock") already did around driver binding alone.

Without reset_lock there, an SBR can again race pci_scan_slot() and
leave a register unreadable during enumeration, so the device fails
to be enumerated correctly. Hand that serialization to
pci_rescan_remove_lock, which already spans the scan.

pci_reset_bridge() and pci_reset_bus() issue the SBR unconditionally,
with no check on what else is on the bus, so they need
pci_rescan_remove_lock. pci_host_reset_root_port() no longer takes the
lock itself, since pci_reset_bridge() now does.

pci_reset_function()/pci_try_reset_function() are left without the
lock: their SBR fallback (pci_dev_reset_slot_function(), then
pci_parent_bus_reset()) only fires once it confirms the device is the
sole occupant of its bus, so it cannot race the scan that populates
that bus with a sibling device. And being able to call
pci_reset_function(dev) at all means dev is already fully enumerated.

vmd_enable_domain() calls the new pci_reset_bus_unlocked(), skipping
pci_rescan_remove_lock, since it runs from vmd_probe() with
device_lock already held and taking the lock there would invert the
lock order. This is safe because there is no concurrent scanner to
race: the VMD bridge was found by the initial root bus scan, and any
hotplug controller below it does not exist yet at this point. Neither
that scan nor pci_scan_child_bus() earlier in this same function was
ever protected by reset_lock.

Fixes: 5b3f7b7d062b ("PCI: pciehp: Avoid slot access during reset")
Fixes: 4c99bace4f4e ("PCI: host-common: Add link down handling for Root Ports")
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Changes in v2:
- Rebase on latest pci main branch
- Link to v1: https://lore.kernel.org/all/20260817-ab-ba-deadlock-v1-1-e619fd07d1fd@oss.qualcomm.com/ 
---
 drivers/pci/controller/pci-host-common.c |  2 -
 drivers/pci/controller/vmd.c             |  2 +-
 drivers/pci/hotplug/pciehp_pci.c         | 24 ++++++------
 drivers/pci/pci.c                        | 64 +++++++++++++++++++++++++++++---
 include/linux/pci.h                      |  1 +
 5 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index a23907a875e5..299248316b4c 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -329,9 +329,7 @@ static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
 {
 	int ret;
 
-	pci_lock_rescan_remove();
 	ret = pci_bus_error_reset(dev);
-	pci_unlock_rescan_remove();
 	if (ret) {
 		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
 		return PCI_ERS_RESULT_DISCONNECT;
diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index 9d97a832785e..9350fda6cb4e 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -1112,7 +1112,7 @@ static int vmd_enable_domain(struct vmd_dev *vmd, unsigned long features)
 		if (!list_empty(&child->devices)) {
 			dev = list_first_entry(&child->devices,
 					       struct pci_dev, bus_list);
-			ret = pci_reset_bus(dev);
+			ret = pci_reset_bus_unlocked(dev);
 			if (ret)
 				pci_warn(dev, "can't reset device: %d\n", ret);
 
diff --git a/drivers/pci/hotplug/pciehp_pci.c b/drivers/pci/hotplug/pciehp_pci.c
index 65e50bee1a8c..b2698a530f59 100644
--- a/drivers/pci/hotplug/pciehp_pci.c
+++ b/drivers/pci/hotplug/pciehp_pci.c
@@ -36,6 +36,11 @@ int pciehp_configure_device(struct controller *ctrl)
 	struct pci_bus *parent = bridge->subordinate;
 	int num, ret = 0;
 
+	/*
+	 * Release reset_lock before rescan/remove
+	 * to avoid AB-BA deadlock with pci_rescan_remove_lock.
+	 */
+	up_read(&ctrl->reset_lock);
 	pci_lock_rescan_remove();
 
 	dev = pci_get_slot(parent, PCI_DEVFN(0, 0));
@@ -64,13 +69,7 @@ int pciehp_configure_device(struct controller *ctrl)
 	pci_assign_unassigned_bridge_resources(bridge);
 	pcie_bus_configure_settings(parent);
 
-	/*
-	 * Release reset_lock during driver binding
-	 * to avoid AB-BA deadlock with device_lock.
-	 */
-	up_read(&ctrl->reset_lock);
 	pci_bus_add_devices(parent);
-	down_read_nested(&ctrl->reset_lock, ctrl->depth);
 
 	dev = pci_get_slot(parent, PCI_DEVFN(0, 0));
 	ctrl->dsn = pci_get_dsn(dev);
@@ -78,6 +77,7 @@ int pciehp_configure_device(struct controller *ctrl)
 
  out:
 	pci_unlock_rescan_remove();
+	down_read_nested(&ctrl->reset_lock, ctrl->depth);
 	return ret;
 }
 
@@ -104,6 +104,11 @@ void pciehp_unconfigure_device(struct controller *ctrl, bool presence)
 	if (!presence)
 		pci_walk_bus(parent, pci_dev_set_disconnected, NULL);
 
+	/*
+	 * Release reset_lock before rescan/remove
+	 * to avoid AB-BA deadlock with pci_rescan_remove_lock.
+	 */
+	up_read(&ctrl->reset_lock);
 	pci_lock_rescan_remove();
 
 	/*
@@ -116,13 +121,7 @@ void pciehp_unconfigure_device(struct controller *ctrl, bool presence)
 					 bus_list) {
 		pci_dev_get(dev);
 
-		/*
-		 * Release reset_lock during driver unbinding
-		 * to avoid AB-BA deadlock with device_lock.
-		 */
-		up_read(&ctrl->reset_lock);
 		pci_stop_and_remove_bus_device(dev);
-		down_read_nested(&ctrl->reset_lock, ctrl->depth);
 
 		/*
 		 * Ensure that no new Requests will be generated from
@@ -138,4 +137,5 @@ void pciehp_unconfigure_device(struct controller *ctrl, bool presence)
 	}
 
 	pci_unlock_rescan_remove();
+	down_read_nested(&ctrl->reset_lock, ctrl->depth);
 }
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..211808f7bd1f 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5750,6 +5750,13 @@ static int pci_reset_bridge(struct pci_dev *bridge, bool restore)
 	if (!bus)
 		return -ENOTTY;
 
+	/*
+	 * The reset below may issue a Secondary Bus Reset, which races with
+	 * pciehp enumerating a newly inserted device. Serialize via
+	 * pci_rescan_remove_lock; callers must not already hold it.
+	 */
+	lockdep_assert_not_held(&pci_rescan_remove_lock);
+	pci_lock_rescan_remove();
 	mutex_lock(&pci_slot_mutex);
 	if (list_empty(&bus->slots))
 		goto bus_reset;
@@ -5769,13 +5776,17 @@ static int pci_reset_bridge(struct pci_dev *bridge, bool restore)
 	}
 
 	mutex_unlock(&pci_slot_mutex);
+	pci_unlock_rescan_remove();
 	return ret;
 bus_reset:
 	mutex_unlock(&pci_slot_mutex);
 
 	if (restore)
-		return pci_try_reset_bus(bus);
-	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
+		ret = pci_try_reset_bus(bus);
+	else
+		ret = pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
+	pci_unlock_rescan_remove();
+	return ret;
 }
 
 /**
@@ -5805,19 +5816,62 @@ int pci_probe_reset_bus(struct pci_bus *bus)
 }
 EXPORT_SYMBOL_GPL(pci_probe_reset_bus);
 
+/*
+ * Core of pci_reset_bus(), run with pci_rescan_remove_lock already held or
+ * known not to be needed.  See pci_reset_bus_unlocked() for the latter case.
+ */
+static int __pci_reset_bus(struct pci_dev *pdev)
+{
+	return (!pci_probe_reset_slot(pdev->slot)) ?
+	    pci_try_reset_slot(pdev->slot) : pci_try_reset_bus(pdev->bus);
+}
+
 /**
  * pci_reset_bus - Try to reset a PCI bus
  * @pdev: top level PCI device to reset via slot/bus
  *
- * Same as above except return -EAGAIN if the bus cannot be locked
+ * Same as above except this blocks until pci_rescan_remove_lock can be
+ * acquired, and still returns -EAGAIN if the underlying slot/bus device
+ * lock cannot be taken.
  */
 int pci_reset_bus(struct pci_dev *pdev)
 {
-	return (!pci_probe_reset_slot(pdev->slot)) ?
-	    pci_try_reset_slot(pdev->slot) : pci_try_reset_bus(pdev->bus);
+	int rc;
+
+	/*
+	 * pci_try_reset_slot()/pci_try_reset_bus() below may issue a
+	 * Secondary Bus Reset, which races with concurrent bus scanning.
+	 * Serialize against that via pci_rescan_remove_lock, taken before
+	 * the slot's/bus's device locks to match the lock order used by
+	 * pciehp.
+	 */
+	pci_lock_rescan_remove();
+
+	rc = __pci_reset_bus(pdev);
+
+	pci_unlock_rescan_remove();
+
+	return rc;
 }
 EXPORT_SYMBOL_GPL(pci_reset_bus);
 
+/**
+ * pci_reset_bus_unlocked - Try to reset a PCI bus without taking
+ *			    pci_rescan_remove_lock
+ * @pdev: top level PCI device to reset via slot/bus
+ *
+ * Same as pci_reset_bus(), except it does not take pci_rescan_remove_lock.
+ * For callers reached from a driver .probe callback, where pci_rescan_
+ * remove_lock may already be held by the caller of pci_bus_add_devices(),
+ * or may not be held at all; taking it here either self-deadlocks or
+ * inverts the pci_rescan_remove_lock -> device_lock order.
+ */
+int pci_reset_bus_unlocked(struct pci_dev *pdev)
+{
+	return __pci_reset_bus(pdev);
+}
+EXPORT_SYMBOL_GPL(pci_reset_bus_unlocked);
+
 /**
  * pcix_get_max_mmrbc - get PCI-X maximum designed memory read byte count
  * @dev: PCI device to query
diff --git a/include/linux/pci.h b/include/linux/pci.h
index aa3765a20a96..286867395072 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1492,6 +1492,7 @@ int pci_try_reset_function(struct pci_dev *dev);
 int pci_probe_reset_slot(struct pci_slot *slot);
 int pci_probe_reset_bus(struct pci_bus *bus);
 int pci_reset_bus(struct pci_dev *dev);
+int pci_reset_bus_unlocked(struct pci_dev *dev);
 void pci_reset_secondary_bus(struct pci_dev *dev);
 void pcibios_reset_secondary_bus(struct pci_dev *dev);
 void pci_update_resource(struct pci_dev *dev, int resno);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261126-fix_deadlock_1126-7b9bd5dade50

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>


