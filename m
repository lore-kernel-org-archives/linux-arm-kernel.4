Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B8F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aT1U4cjN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nawmy5R3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IwYR7jxyy0oU38HwdJ0V2hMTdj58xBYLEDilB4VyrlY=; b=aT1U4cjNdoWYscrHOjD/Mw6Tp9
	PrZc8YEVRSJZc8CzEHsFCs9ZpfCi0ik4baaKeZjPx5xZfi8rx3nEfneVE8vfkwJCOvuT+Sa/9IuZd
	36iY+/EY5gdXAZW619ZKeTKV0YVUh3GFUfmRzhaHXvcx9596zVbXUUE9QSlTUxShB8aR2K6ILoFdO
	JYsDzi7169pORXH5yR1btvBmRonJWIRMCDJXKYABYZqebEGu2Ad8QXXg4Z5bXzMO4mkAtvvDL/PeC
	fKzEM9i1O74LLYVt7oWYpIf2gpeSOP1sssUUjJ4tx2TvuWd00WIH54gyIxGWT63FaVjtThl4eyRCe
	EsuZTkHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFfQ-0000000AWWJ-12aN;
	Wed, 25 Nov 2026 16:16:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFfO-0000000AWWA-3p8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:16:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 920D645639;
	Wed, 25 Nov 2026 16:16:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795623378;
	b=HGWNJwKbsV7dLaY7pYib+NIJBTepEjLBWEBgY0ttxl3t8xU+YgAk+I3SikcUnclUgI5n
	 is4qcBzUwq2BMHyM3QPOjtvQCs05j4kTe6sLlClQKWifrbaoEGwKkMpccIi9VHEwxPSVT
	 MS+U/QhpFOzyk4UqqzXcRE0hOTceHTAZ7AO8RNnawmgrLprcYZ6O4xFTyi48W9Eo24iHc
	 0vg8Nc+4Lug2SjkkNmEZpd8WUlkO7byI8NVs70o4NGFYi4TfO8B9JJVxyesstsN4rNeGr
	 1TjigJimRFjE0CTYYLGEemNv1LJIINtSHzVJOKfWDn6bS+rqWr2Koi3YpuGqqD5Yt6A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623378;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=IwYR7jxyy0oU38HwdJ0V2hMTdj58xBYLEDilB4VyrlY=;
	b=uuedYbhRy+alekMV9l+Gf7IfIaADthkGdthFV3WcCwlikbZwUWobQivHvdrqGsUQFCU/
	 evjAM7oygvcoZREUTl6npxPX6/TTFxrm9SA4V0kDmvvZ+71lS880qnpU01bT1MhncnMH8
	 n9vbJ1pQr9Y37Yv6oj/Om9LAtwUgzJXheENvwDF+EJpoyV2UFZEBqYhqc4A8kTLPjAhoT
	 A2Bq3M4Mlyk8ShgWnxZLvPSA1+BHp2aPBnG02pAed2EjhzCz3mYroEGY/IEQsB1icvZ9R
	 702V8wqxSTVzJj5hWAFitGa4MAzAKy3iuWqA67HPfzyxseM/T6PAH6ppBsgg9NK+BzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1B51D1F000C4;
	Wed, 25 Nov 2026 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623378;
	bh=IwYR7jxyy0oU38HwdJ0V2hMTdj58xBYLEDilB4VyrlY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=nawmy5R3E9sNrpBwSBLZ+SSd1Pj+dCjEnG9Sk4mzO/diiZiMEJhAKYqrmPigCEbbw
	 F5ncib03aObHeK9/3OQAvMfpKSFHC+MXxw+YshSbAxgB7TPbYi9yZ25+a+A/Iu6xdG
	 RbLte12ZKCoz/t35g4YXjoB5zAWIGGENd+NZDy4VFos3hfp3+PKu+QCAQ3gLYX6zjU
	 WvrGT9Xbqv/TGv8zX0Cz9zhfN+EORkwa9SJuyz6UBZDz6YfwllDKJVMPbR3ACTGzSF
	 ZMlBS96pj79whmW8cEDvCgHmABC3fl3beI0AL56mKEf13jGgFSZe3cTSZjyLrknFDM
	 NGKOclEcT+n9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 73DCB4CF5B;
	Wed, 25 Nov 2026 16:16:14 +0000 (UTC)
From: Sylvain Chouleur via B4 Relay <devnull+schouleur.snap.com@kernel.org>
Date: Wed, 25 Nov 2026 17:15:53 +0100
Subject: [PATCH] perf/arm-cmn: Use at least 2 bits per XP coordinate in
 node IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-arm-cmn-xyidbits-v1-1-6f7bee891859@snap.com>
X-B4-Tracking: v=1; b=H4sIALgJB2sC/yXMQQqDMBBA0avIrB0wA0bxKqWLmIx1BGPJaLGId
 zety7f4/wDlJKzQFQck/ojKEjNMWYAfXXwxSsgGqsgaQzW6NKOfI+5fCb2sisZWjeUwUOsIcvZ
 OPMj+Xz6et3XrJ/br7wPneQGnp47/dAAAAA==
X-Change-ID: 20261125-arm-cmn-xyidbits-16076edf28a2
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 stable@vger.kernel.org, Sylvain Chouleur <schouleur@snap.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795623374; l=2076;
 i=schouleur@snap.com; s=20261125; h=from:subject:message-id;
 bh=sa9PZCg2nW0vzlkWYPAJtFCSQhJMIg5Z6aFqeJbc3f0=;
 b=v8agyqySqDUxULbbTkNaysEzgYXGF2W7BwMxU/Z+NgcPXhzJMgZl8a//oBEcG1GqcKYbqI8kz
 7drwmw6dVbvAOmVnsA5sFaXDQwNFBEmM+zMoEN6tmjRLvhpuZbWVJFD
X-Developer-Key: i=schouleur@snap.com; a=ed25519;
 pk=T9TO/S3sm76Hkq5JdP/4AATQ2J2jGtskIHx0NY9lD4I=
X-Endpoint-Received: by B4 Relay for schouleur@snap.com/20261125 with
 auth_id=1639
X-Original-From: Sylvain Chouleur <schouleur@snap.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: schouleur@snap.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sylvain Chouleur <schouleur@snap.com>

The X and Y coordinates in a CMN/CI-700 node ID are encoded in 2 bits
each for any mesh up to 4x4 (7-bit node IDs), and in 3 bits each for
larger meshes (9-bit node IDs). The width does not shrink for smaller
meshes: a 2x2 mesh still uses 2 bits per coordinate.

arm_cmn_xyidbits() derives the width from the actual mesh dimensions,
which yields 1 bit for a mesh with both dimensions <= 2. On such a
mesh arm_cmn_node_to_xp() then decodes every device on the X=1 column
into the wrong XP: X=1,Y=0 devices are attributed to XP (0,1), and
X=1,Y=1 devices to an index past the end of the XP array. Their PMU
events end up programmed into another XP's DTM, with the port/device
select of the intended XP, so the counters silently read zero while
the rest of the mesh works.

Observed on a CI-700 r3 with a 2x2 mesh (part 0x43a), where the SBSX
and HN-D nodes on the X=1 column never counted although the XP flit
counters showed the traffic. Forcing a minimum of 2 coordinate bits
matches the documented node ID format and makes all nodes count;
the minimum had been there until the node ID refactor dropped it.

Fixes: e79634b53e39 ("perf/arm-cmn: Refactor node ID handling. Again.")
Cc: stable@vger.kernel.org
Signed-off-by: Sylvain Chouleur <schouleur@snap.com>
---
 drivers/perf/arm-cmn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 68a096c1fe6b..5f369c7a7a35 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -406,7 +406,8 @@ struct arm_cmn_nodeid {
 
 static int arm_cmn_xyidbits(const struct arm_cmn *cmn)
 {
-	return fls((cmn->mesh_x - 1) | (cmn->mesh_y - 1));
+	/* Node IDs never use fewer than 2 bits per XP coordinate */
+	return fls((cmn->mesh_x - 1) | (cmn->mesh_y - 1) | 2);
 }
 
 static struct arm_cmn_nodeid arm_cmn_nid(const struct arm_cmn_node *dn)

---
base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
change-id: 20261125-arm-cmn-xyidbits-16076edf28a2

Best regards,
--  
Sylvain Chouleur <schouleur@snap.com>



