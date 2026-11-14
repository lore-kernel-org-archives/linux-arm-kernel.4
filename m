Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9835F606A8B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WX+kCFRA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EXWPXysT;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=Q2bis67B;
	dkim=neutral header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B4vCN7n/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jLe41rxtvqSNao2UIdbEczdLg1Uh1yqAQx73nNAS2+o=; b=WX+kCFRANFq4ct
	wFHEG/2dADTuFAWs7gwc2coREMnfMIoq11AmK/4X9uVzELjMSs1mKyKv2UhK+9dgYdGGCBWhPlJlP
	0821UkkM1v4QPdiZYMwxKIEzpXOPr1jqnJv5gukjmJim2FytdLG3nhAtOnpvh7mAtJyEspD82mhhu
	jM7cp1iOUYNsdRU3obeKRhcAftEqQhMBm4rQCA/xcm9/i3o94OKj0AxxFWOvPgM9yq06BQ4k9iBYM
	vWfsim2Geon1Ee12Uyg9o+qGjFiZfbky7j0Zj6pNRa8aDx9eBkXGEhfRCtrPre2oac4roHwClYxf9
	57qTmEZs2+GzwtMVjqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS464-0000000FAko-2XX3;
	Sat, 14 Nov 2026 03:06:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS45t-0000000FAVf-2scY
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 14 Nov 2026 03:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=jLe41rxtvqSNao2UIdbEczdLg1Uh1yqAQx73nNAS2+o=; b=EXWPXysTfgBC1ml7LSczNT7uBg
	VjjKlz9dviXhIRMp1ggQsYjC+N2K5na9vpYJ9dD3xpHYmxNZA3rSBgOEwStGPYpcB7L0Gje+duLi7
	eK7qNThDsued2MEN/7RLaC9/OAuBqeInmYQK0LKVM01Erx9IxyZjFFJV4T4BRTknq/wohhAa+LXrj
	V0Mqgt3hEz0pgmhHk9u57Fmtt9H5AQffbfF4lkapNMS/G72QQsHxMCXWSZFKU8Ca2YAno1ZJJta1T
	uC0ORSygR3ucd0fQ/vgzjZzUNVPOrn8iCtfR+JKZzE+3gBU/2EJ4onhz4QlRkgMM6l3RR/dbTpKVp
	x0Lb5PUQ==;
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS45i-0000000C5YS-0hgH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:06:20 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id C73051381A55
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:06:03 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 13 Nov 2026 22:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625563; x=
	1794632763; bh=jLe41rxtvqSNao2UIdbEczdLg1Uh1yqAQx73nNAS2+o=; b=Q
	2bis67BhJj54JWwFsmK/fPB8oUBjT61R0xXvk39k4dEQ/ED0y7bEKTXQMV8iig//
	3y8LnPHtsV8rnufqemKOGZDs5NaF/dq5j4k+sru2mPc7mjG1ejfcrBDJ6+QUnV2n
	Oy/LARV7p96A6se7uOBgYURdC0I+6kvJnRnGgVOEz74Jn/M2ojUP8tG+joaSuxBP
	2VOakmQ5dgP5C/NtfvjJGLTeaP1nMzS3REmWHQ7K2k19cjvFZgOJgu7wchOYKyQb
	2/UlX/GTY6iWwT1iZVu0IrKpLJc72jej7SH6Sar7pcJkiCUpTO2WRYM5Z8/FH6vC
	sHUqP1TYbpqOP50YarJTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625563; x=1794632763; bh=j
	Le41rxtvqSNao2UIdbEczdLg1Uh1yqAQx73nNAS2+o=; b=B4vCN7n/WzyEO7hNX
	rzQ0pKADmvpvu3gLLsXUGnytSEF658SWm1+tAJkrxi7L7tB8xSRdxbAQrIPTzHme
	klxZEhcJee0Nz3nhGNVkAfzDOJedaWZzoQPjJsXUOi+ZueuTtOc3koCLDtR9yTLc
	G8fqkDixoPC5e9zCW9S43iNMPqpGsfbqvEmsdF5Jrli09Dp9XAZqXeStaQEHmWgC
	zDugmbEa2Aux1cM8S8DNpRXDmgB8TNPF2vc2iseRheCl2phZhhC+vZOu3RWLxJUi
	0hoIoX0gWrHhLabLCd/mWeEGPVUPpWTHZxxNz+m95QuJe/zyN5ktcOLTgk3ilQK9
	32v0w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625563; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:ZV7d44CThSMpD0/KYrUDrrakmA/Dqgt1uMbd8bTwQkVpklu
	l+Z2WQqf2ttmhhKTb7s3YMHVoPrvlRZyHu6Qw7Butq2Awt2oXzkLb10r5iY6pKuC
	HZhkDnCID8lh2axanhzk/6ANq6FeeJDK37dcRlPI4nWTOz9FpTEfsO4PpyFPV4QI
	n/JyQt17Eu35AlfK9JO5FabhT5DtZgnjBj5Ikbc7UIh+kSqskr9lHRLNKaNRPnK9
	fIeDku3Cao8zcqmKYXMnvF6SUCGhbv0vR0NID7Qwv0M/5JMpO9CeX5CI2JvvvV/x
	iDgdUILPtvDRpPW/ZgbgHSOC0FK2//PvEkcAnug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KkU9OItywWMXa8xCxJXvpsCUuVVYeELHJ3ZywXHw29k=:7oH1PnecAoj3OHP3QYcSMmdKkLdmCJWxLcqrSSziT3Y=;
X-ME-Sender: <xms:G9D3aoSLjEKSjs0QnKzQZxIP6-1_QH3SZvtWjCxW5jZ4lavCL_FpGQ>
    <xme:G9D3aiOAb5Tdj7A3IpUIelKXn8T3Yj0CumWmHOcP1r8afC5npJEsTe7fVryhWgiMG
    lqO47uLsWHuXu4dYYqmRr2YU7AAedGCvblygfz3nKGZ73xMcyiVdP4>
X-ME-Received: <xmr:G9D3atFLu-VezKaxS5G_SCUZwFk9xOuQinha3XV4xVq12sYK-7dFJD7TyF559-jCzI8cRDJT>
X-ME-Proxy-Cause: dmFkZTENh3Cq6bNtRDDqH//naJpK03OGhXB8Cp3eHHX2EpHYf2oBjZ1/43ruyqVDLzR5bI
    q7gV+k53czH7SJj0JMNaMvWBGkaUqaereb01ifHpul1q14DobEKJC2mDvQQE3HzqoOU9gl
    QO0UnCSJOnNpWmY1qWdj/IivEZ+5eJmA8XcRYmqsfPBSZaKqk9zCnQvCGUQuYFJdsYZGP5
    L8zECb373LU+oefpY9jKwOjkFDiU4CWxV3iExHL3zPnpeZwM1wkFJxhm/yJk+2AJ3ju4OO
    RXCknd9xSS299sQU1FiikwzYfEAyF9m0XTBIDoIn2qfRRJDU3uzKkImCFIAQPMS5Q++UYK
    QT1oghQMiLOEEDqc0qJ2Gei+8zpQ5h9f1GYvfROcAztvhWDSYxYdo7YMX5wTM18aoSALCm
    5wmJdp6uvygPFmK2xbqZJXBBZNVNDur6w2x2R+bjTrWRDzbVjqipo8zxlImtnjuEE2Axc7
    ItcGzHZc78kbodAWVyQNpFeV2lkhDDCBF9t//GsvyG9IzF3/sIS52PfJEVWqLlmwMsV53K
    EL/8bvqplcZ8FBIW3bT38f5Tl9LDGu+Jq1EYTJ9OPScIzc3/mocusb9PEy8pvTlTds4dJq
    769cqL/rDifX+Q8SPEOIgG1wgVJEnt2qDoXmVrFsx+prKT7w1Ok45BQYUvJg
X-ME-Proxy: <xmx:G9D3aigq3vbtqueHcg0UsqjvBJRwNtI4s75DY3xgp5q9zKbcCgwSHQ>
    <xmx:G9D3ahxIO5dRfxtiOQbhCQ1vw4P4ZraV2l8EoGdD2osR-4nivWdfuA>
    <xmx:G9D3aurSVr-PJOhlMIHENeO7J5-BcCe-lyq2nJBVoES5EcV0sF6FXw>
    <xmx:G9D3anX-D6pijwhcb6qgMYEHOZwUHOGnlmQWdLjm60KDC4oUovc4dQ>
    <xmx:G9D3ajV36tZGG6rr-HBXMH2F8KK2KwTCPBxXcodFKRJ7ZNBER7416FpB>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:05:54 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 02/12] accel/rocket: take the completion register writes under job_lock
Date: Sat, 14 Nov 2026 16:05:19 +1300
Message-ID: <1adbff3238fd312e23daab83ed936ad13d7f223f.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_030610_270952_0398A382 
X-CRM114-Status: GOOD (  13.84  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The IRQ handler writes OPERATION_ENABLE and INTERRUPT_CLEAR before it
takes job_lock, while rocket_job_hw_submit() sets OPERATION_ENABLE to 1
under that lock.

If the two run at the same time, the 0 written by the IRQ handler can
overwrite the 1 written for a new task and stop a task that has just
started.

Move both writes into the existing scoped_guard(), so they are under the
same lock as the submit.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, three cores, induced reset, JOB_TIMEOUT_MS=2
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/rocket_job.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index b2a00992c889..b61bb4d242ce 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -371,10 +371,15 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 {
 	pm_runtime_mark_last_busy(core->dev);
 
-	rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
-	rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
+	scoped_guard(mutex, &core->job_lock) {
+		/*
+		 * Stopping the block belongs under the lock. hw_submit() writes
+		 * OPERATION_ENABLE too, and outside the lock this zero can land
+		 * after that one and stop a task that has only just started.
+		 */
+		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
+		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);
 
-	scoped_guard(mutex, &core->job_lock)
 		if (core->in_flight_job) {
 			if (core->in_flight_job->next_task_idx < core->in_flight_job->task_count) {
 				rocket_job_hw_submit(core, core->in_flight_job);
@@ -386,6 +391,7 @@ static void rocket_job_handle_irq(struct rocket_core *core)
 			pm_runtime_put_autosuspend(core->dev);
 			core->in_flight_job = NULL;
 		}
+	}
 }
 
 static void
-- 
2.43.0


